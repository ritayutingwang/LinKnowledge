# == Schema Information
#
# Table name: backings
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  amount     :float
#  reward     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Backing < ActiveRecord::Base
  belongs_to :project
  include BelongsToUser
end
