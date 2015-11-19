# == Schema Information
#
# Table name: sections
#
#  id           :integer          not null, primary key
#  page_id      :integer
#  name         :string(255)
#  position     :integer
#  visible      :boolean          default(FALSE)
#  content_type :string(255)
#  content      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Section < ActiveRecord::Base
  belongs_to :page
  has_many :section_edits
end
