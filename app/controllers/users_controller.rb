class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user, :check_permission

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to session.delete(:previous_url) || root_path, notice:'Your settings are updated'
    else
      redirect_to edit_user_path(@user), flash: { error: 'Some errors occured while updating your settings, please try again' }
    end
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def check_permission
    redirect_to root_path unless current_user && @user == current_user
  end

  def user_params
    params.require(:user).permit(
      :nickname, :usingIdenticon
    )
  end
end
