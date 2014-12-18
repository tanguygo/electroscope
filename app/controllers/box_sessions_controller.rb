class BoxSessionsController < ApplicationController
  layout "dashboard"
  before_action :set_box, only: [:create]

  def create
    @box_session = @box.box_sessions.new(flat:current_user.flat)
    if @box_session.save
      @box_session.activate
      redirect_to flat_devices_path(current_user.flat)
    else
      render :new, alert: @box_session.errors.full_messages.join('-')
    end
  end

  def new
    @box_session=BoxSession.new()
    @box=Box.new()
  end

  private

  def set_box
    if (@box = Box.find_by_internal_ref(box_params[:internal_ref])).nil?
      flash[:alert] = "Le code d'activation n'a pas été reconnu."
      redirect_to activation_path
    end
  end

  def box_params
    params.require(:box_session).require(:box).permit(:internal_ref)
  end



end
