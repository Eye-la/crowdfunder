class ProjectsController < ApplicationController

  before_filter :require_login, except: [:index, :show]

  def index
    @categories = Category.all
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
    # @project.rewards.pledges.build
  end

  def create
    @project = Project.new(project_params)
    # @project = Project.new(name: params[:project][:name], description: params[:project][:description])
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
    params.require(:project).permit(:name, :description, :category_id, :funding_goal, :start_date, :end_date, :tag_list, rewards_attributes: [:id, :title, :description, :amount, :backer_limit, :destroy])
  end
end
