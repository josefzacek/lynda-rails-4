# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  name       :string(255)
#  pemalink   :integer
#  position   :integer
#  visible    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, class_name: 'AdminUser'

  scope :visible, lambda {
    where(visible: true)
  }

  scope :invisible, lambda {
    where(visible: false)
  }

  scope :sorted, lambda {
    order('pages.position ASC')
  }

  scope :newest_first, lambda {
    order('pages.created_at DESC')
  }
end
