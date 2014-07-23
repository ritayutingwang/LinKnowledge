module BelongsToUser
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end

  def update_user(user)
   self.user = user
   self.save
  end
end
