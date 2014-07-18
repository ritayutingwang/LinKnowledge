# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(255)
#  description  :text
#  due_day      :date
#  init_day     :date
#  target_price :float            default(10000.0)
#  status       :string(255)      default("open")
#  amount       :float
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
