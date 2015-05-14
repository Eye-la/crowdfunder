class ProjectsController < ApplicationController

  before_filter :require_login, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.rewards.build
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @project = Project.new(project_params)
    @project.category_id = params[:category_id]
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
    params.require(:project).permit(:name, :description, :category_id, :funding_goal, :start_date, :end_date, rewards_attributes: [:id, :title, :description, :amount, :backer_limit, :destroy])
  end
end
