# == Schema Information
#
# Table name: projects
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  name                  :string(255)
#  description           :text
#  city                  :string(255)
#  class_datetime        :datetime
#  capacity              :integer          default(12)
#  duration              :integer          default(12)
#  status                :string(255)      default("open")
#  minimum_backing_value :float            default(12.0)
#  total_value           :float
#  created_at            :datetime
#  updated_at            :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
