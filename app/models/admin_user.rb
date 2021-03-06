# == Schema Information
#
# Table name: admin_users
#
#  id              :integer          not null, primary key
#  username        :string(25)
#  email           :string(25)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string(255)
#  last_name       :string(255)
#  password_digest :string(255)
#

class AdminUser < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = %w(dublinireland has_manyelloworld superadmin)

  validates_presence_of :first_name
  validates_length_of :first_name, maximum: 25
  validates_presence_of :last_name
  validates_length_of :last_name, maximum: 50
  validates_presence_of :username
  validates_length_of :username, within: 8..25
  validates_uniqueness_of :username

  # shortcut validation
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: EMAIL_REGEX },
                    confirmation: true

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
