class RewardsController < ApplicationController
	before_filter :load_project

  def new
  end

  def create
  	@reward = @project.rewards.build(rewards_params)
    @project = project_id
  end

  def show
  	@reward = Reward.find(params[:id])
  end

  private
  def reward_params
  	params.require(:reward).permit(:title, :description, :amount, :backer_limit, :project_id)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
end
