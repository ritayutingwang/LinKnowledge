class ProjectsController < ApplicationController
  def index
    @projects = Project.last 3
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    redirect_to @project
  end

  def show
    @project = Project.find params[:id]
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :due_day, :init_day)
  end
end
