# == Schema Information
#
# Table name: admin_users
#
#  id              :integer          not null, primary key
#  username        :string(25)
#  email           :string(25)
#  hashed_password :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string(255)
#  last_name       :string(255)
#

class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = %w(dublinireland has_manyelloworld superadmin)
  validate :username_is_allowed

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, 'has been restricted from use.')
    end
  end

  validate :no_new_users_on_friday, on: :create

  def no_new_users_on_friday
    if Time.now.wday == 5
      errors[:base] << 'No new users on Friday'
    end
  end
end
