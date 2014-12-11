class DevicesController < ApplicationController
  layout "dashboard"

  def index
    @flat = current_user.flat
    @devices = Device.where(flat_id: current_user.flat.id)
  end


  def new
    @device = Device.new
    @device_types = DeviceType.all
  end

  def create
  end

  def create_multiple
    names = {}
    device_array = device_params[:deviceString].split(" ")
    device_array.each do |d|
      @device = Device.new(device_type_id: d.to_i)
      @device.flat_id = device_params[:flat_id].to_i

      name = @device.device_type.name

      if names[name] == nil
        names[name] = 1
      else
        names[name] += 1
      end

      @device.name = pick_right_name(name, names)
      @device.save
    end
    redirect_to root_path
  end

  private

  def pick_right_name(device_name, names)
    new_name = device_name + " " + names[device_name].to_s
    return new_name
  end

  def device_params
    params.permit(:name, :device_type_id, :flat_id, :deviceString)
  end

end
