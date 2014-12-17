class DevicesController < ApplicationController
  layout "dashboard"
  before_action :set_flat, only: [:index,:create_multiple]

  def index
    @devices = @flat.devices
  end

  def new
    @device = Device.new
    @device_types = DeviceType.all
  end

  def create
  end

  def create_multiple
    @flat.devices.destroy_all
    device_params[:deviceString].split(" ").each do |d|
      device_type_id = d.to_i
      device_type_rank = @flat.device_types.where(id: device_type_id).size + 1
      @device = @flat.devices.create(
        device_type_id: device_type_id,
        name: DeviceType.find(device_type_id).name + " " + device_type_rank.to_s
        )
    end
    redirect_to flat_devices_path
  end

  private

  def device_params
    params.permit(:name, :device_type_id, :flat_id, :deviceString)
  end

  def set_flat
    @flat = current_user.flat
  end

end
