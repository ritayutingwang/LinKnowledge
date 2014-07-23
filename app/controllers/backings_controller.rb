class BackingsController < ApplicationController
  before_action :set_project
  before_action :authenticate_user!, only: [:confirmation, :create]

  def new
    @backing = Backing.new
  end

  def create
    @backing = @project.backings.create(backing_params)
    @backing.update_user current_user
    redirect_to project_backing_path(@project, @backing)
  end

  def confirmation
    @backing = @project.backings.build(backing_params)
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
