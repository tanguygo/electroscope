class SponsorshipController < ApplicationController
  before_action :set_user, only: [:show]
  layout "dashboard"

  def show
  end

  def new
  end

  def create
  end

  private

  def sponsor_params
    params.require(:sponsorship).permit(:giver_id, :receiver_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

