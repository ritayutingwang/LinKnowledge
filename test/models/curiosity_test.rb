# == Schema Information
#
# Table name: curiosities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class CuriosityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
