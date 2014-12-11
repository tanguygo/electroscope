class ChangeTypeToDeviceTypes < ActiveRecord::Migration
  def change
    rename_column :device_types, :type, :name
  end
end
