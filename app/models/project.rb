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

class Project < ActiveRecord::Base
  has_many :backings
  include BelongsToUser

  def due_time(zone)
    (self.created_at + self.duration.days).in_time_zone(zone).to_datetime
  end

  def time_left
    secs = self.duration.days - (Time.now.utc - self.created_at).to_int
    mins = secs / 60
    hours = mins / 60
    days = hours / 24

    if days > 0
      "#{days} days and #{hours % 24} hours"
    elsif hours > 0
      "#{hours} hours and #{mins % 60} minutes"
    elsif mins > 0
      "#{mins} minutes and #{secs % 60} seconds"
    elsif secs >= 0
      "#{secs} seconds"
    end
  end
end
