class BoxSessionsController < ApplicationController

  before_action :set_box, only: [:create]

  def create
    @box_session = BoxSession.new(box: @box,flat:current_user.flat,start_date:Time.now(),activated:true,connected:false)
    if @box_session.save  #sauve l'utilisateur au passage
      @user.send_activation_email
      redirect_to root_path
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
    @box = Box.find_by_internal_ref(params[:box_identifier])
  end

  def box_params
    params.require(:box_session).require(:box).permit(:internal_ref)
  end

end
