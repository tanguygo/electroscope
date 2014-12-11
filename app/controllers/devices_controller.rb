class DevicesController < ApplicationController
  layout "dashboard"

  def index
    @devices = Device.where(flat_id: current_user.flat.id)
  end


  def new
    @device = Device.new
    @device_types = DeviceType.all
  end

  def create
  end

  def create_multiple
    device_array = device_params[:deviceString].split(" ")
    device_array.each do |d|
      @device = Device.new(devicetype_id: d.to_i)
      @device.flat_id = device_params[:flat_id].to_i
      @device.save
    end
    redirect_to root_path
  end

  private

  def device_params
    params.permit(:name, :devicetype_id, :flat_id, :deviceString)
  end

end
