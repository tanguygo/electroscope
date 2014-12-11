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
    destroy_before(device_params[:flat_id])
    names = {}
    device_array = device_params[:deviceString].split(" ")
    device_array.each do |d|
      @device = Device.new(device_type_id: d.to_i)
      @device.flat_id = device_params[:flat_id].to_i

      temp_name = @device.device_type.name

      if names[temp_name] == nil
        names[temp_name] = 1
      else
        names[temp_name] += 1
      end

      @device.name = pick_right_name(temp_name, names)
      @device.save
    end
    redirect_to flat_devices_path
  end

  private

  def destroy_before(flat_id)
    devices = Device.where(flat_id: flat_id)
    devices.each do |d|
      d.destoy
    end
  end

  def pick_right_name(temp_name, names)
    new_name = temp_name + " " + names[temp_name].to_s
    return new_name
  end

  def device_params
    params.permit(:name, :device_type_id, :flat_id, :deviceString)
  end

end
