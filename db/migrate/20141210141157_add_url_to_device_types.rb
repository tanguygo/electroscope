class AddUrlToDeviceTypes < ActiveRecord::Migration
  def change
    add_column :device_types, :url, :string
  end
end
