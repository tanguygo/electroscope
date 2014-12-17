class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

  layout "dashboard"
  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.create(flat_params)
    authorize @flat
    if @flat.save
      redirect_to new_flat_device_path(@flat.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to new_flat_device_path(@flat.id)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to root_path
  end

  private

  def flat_params
    params.require(:flat).permit(:route, :street_number, :locality, :administrative_area_level_1, :postal_code, :country, :number_of_occupants, :surface, :last_yearly_bill, :accommodation_type )
  end

  def set_flat
     @flat = Flat.find(params[:id])
     authorize @flat
  end

end

