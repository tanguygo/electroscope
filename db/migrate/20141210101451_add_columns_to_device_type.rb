class AddColumnsToDeviceType < ActiveRecord::Migration
  def change
    add_column :device_types, :avg_monthly_consumption_02, :float
    add_column :device_types, :avg_monthly_consumption_03, :float
    add_column :device_types, :avg_monthly_consumption_04, :float
    add_column :device_types, :avg_monthly_consumption_05, :float
    add_column :device_types, :avg_monthly_consumption_06, :float
    add_column :device_types, :avg_monthly_consumption_07, :float
    add_column :device_types, :avg_monthly_consumption_08, :float
    add_column :device_types, :avg_monthly_consumption_09, :float
    add_column :device_types, :avg_monthly_consumption_10, :float
    add_column :device_types, :avg_monthly_consumption_11, :float
    add_column :device_types, :avg_monthly_consumption_12, :float
  end
end
