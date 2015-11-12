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

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
