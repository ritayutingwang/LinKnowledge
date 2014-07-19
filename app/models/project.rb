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

class Project < ActiveRecord::Base
  belongs_to :user
  before_save :set_date

  private
  def set_date
    self.init_day = DateTime.now
    self.due_day = DateTime.now + 15
  end
end
