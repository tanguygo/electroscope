class ChangeNameDeviceTypeIdToDevices < ActiveRecord::Migration
  def change
    rename_column :devices, :devicetype_id, :device_type_id
  end
end
