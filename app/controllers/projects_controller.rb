class ProjectsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, rewards_attributes: [:id, :title, :description, :amount, :backer_limit, :destroy])
  end
end
