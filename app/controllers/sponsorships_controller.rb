class SponsorshipsController < ApplicationController
  before_action :set_user, only: [:show, :create]
  before_action :set_sponsorship_as_giver, only: [:show,:new]
  layout "dashboard"

  def show
  end

  def new
    if @sponsorship.nil?
      @sponsorship = Sponsorship.new
    else
      redirect_to sponsorship_path(@sponsorship)
    end
  end

  def create
    @sponsorship = @user.box.sponsorships.new(sponsor_params)
    @sponsorship.giver_id = @user.id
    @sponsorship.status = "active"
    if @sponsorship.save
      redirect_to profile_path(@user)
    else
      render :new, alert: @sponsorship.errors.full_messages.join('-')
    end
  end

  private

  def sponsor_params
    params.require(:sponsorship).permit(:disposal_date, :receiver_email)
  end

  def set_user
    @user = current_user
  end

  def set_sponsorship_as_giver
    @sponsorship = Sponsorship.find_by(giver_id: current_user)
  end
end

