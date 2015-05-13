class PledgesController < ApplicationController
  def create
    @pledge = Pledge.new(pledge_params)
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  private
  def pledge_params
    params.require(:pledge).permit(:pledge_amt)
  end

end
