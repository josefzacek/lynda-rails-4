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
  has_many :editors, through: :section_edits, class_name: 'AdminUser'

  CONTENT_TYPES = %w(text HTML)

  validates_presence_of :name

  scope :visible, lambda {
    where(visible: true)
  }

  scope :invisible, lambda {
    where(visible: false)
  }

  scope :sorted, lambda {
    order('sections.position ASC')
  }

  scope :newest_first, lambda {
    order('sections.created_at DESC')
  }
end
