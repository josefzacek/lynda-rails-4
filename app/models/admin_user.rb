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
#

class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
end
