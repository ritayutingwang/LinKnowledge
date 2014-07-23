class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @projects = Project.last 3
  end

  def new
    if params[:project]
      if user_signed_in?
        #TODO: ugly workaround, may need to improve it in the future
        create_project_and_redirect
      else
        authenticate_user!
      end
    else
      @project = Project.new
    end
  end

  def create
    create_project_and_redirect
  end

  def show
    @project = Project.find params[:id]
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :due_day, :init_day)
  end

  def create_project_and_redirect
    @project = Project.create(project_params)
    @project.update_user current_user
    redirect_to @project
  end
end
