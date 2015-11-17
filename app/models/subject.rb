# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :integer
#  visible    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ActiveRecord::Base
  scope :visible, lambda {
    where(visible: true)
  }

  scope :invisible, lambda {
    where(visible: false)
  }

  scope :sorted, lambda {
    order('subjects.position ASC')
  }

  scope :newest_first, lambda {
    order('subjects.created_at DESC')
  }

  scope :search, lambda {|search|
    where('name LIKE ?', "%#{search}%")
  }
end
