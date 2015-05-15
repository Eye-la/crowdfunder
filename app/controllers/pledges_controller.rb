class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
    @pledge.rewards.build
  end

  def create

    @project = Project.find(params[:project_id])
    @reward = @project.rewards.find(params[:reward_id])

    # not saving project_id
    @pledge = Pledge.new(reward: @reward, user: current_user)

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to project_path(@project), notice: "Pledged #{ActionController::Base.helpers.number_to_currency @reward.amount}" }
        format.js {} # This will look for app/views/reviews/create.js.erb
      else
        format.html { render 'rewards/show', alert: 'There was an error.'  }
        format.js {} # This will look for app/views/reviews/create.js.erb
      end
    end
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

end
