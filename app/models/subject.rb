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
end
