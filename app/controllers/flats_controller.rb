class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
      if @flat.save
        # redirect_to
      else
        render :new
      end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
      if @flat.save
        # redirect_to
      else
        render :edit
      end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :picture)
  end

  def set_flat
     @flat = Flat.find(params[:id])
  end

end
