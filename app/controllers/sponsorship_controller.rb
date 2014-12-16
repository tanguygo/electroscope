class SponsorshipController < ApplicationController
  before_action :set_user, only: [:show, :create]
  layout "dashboard"

  def show
    @sponsorship = Sponsorship.find_by(giver_id: current_user)
  end

  def new
    if Sponsorship.find_by(giver_id: current_user)
      @sponsorship = Sponsorship.find_by(giver_id: current_user)
      redirect_to sponsorship_path(@sponsorship)
    else
      @sponsorship = Sponsorship.new
    end
  end

  def create
    @sponsorship = Sponsorship.new(sponsor_params)
    @sponsorship.giver_id = @user.id
    @sponsorship.giver_id = @user.box
    @sponsorship.status = "invite sent"

    if @sponsorship.save
      @sponsorship.send_sponsor_giver_email(@user)
      @sponsorship.send_sponsor_receiver_email(@user)
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
end

