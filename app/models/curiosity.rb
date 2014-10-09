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

class Curiosity < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: :slugged
end
