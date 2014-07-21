class BackingsController < ApplicationController
  before_action :set_project

  def new
    @backing = Backing.new
  end

  def create
    unless user_signed_in?
      redirect_to user_omniauth_authorize_path(:facebook)
      return
    end
    @backing = @project.backings.create(backing_params)
    @backing.user = current_user
    redirect_to project_backing_path(@project, @backing)
  end

  def show
    @backing = Backing.find params[:id]
  end
  
  private
  def set_project
    @project = Project.find params[:project_id]
  end

  def backing_params
    params.require(:backing).permit(:amount, :reward)
  end
end
