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

require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
