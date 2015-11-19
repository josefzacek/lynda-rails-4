# == Schema Information
#
# Table name: section_edits
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  section_id    :integer
#  summary       :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SectionEdit < ActiveRecord::Base
  belongs_to :editor, class_name: 'AdminUser', foreign_key: 'admin_user_id'
  belongs_to :section
end
