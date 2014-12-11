class AddCategoryToDeviceTypes < ActiveRecord::Migration
  def change
    add_column :device_types, :category, :string
  end
end
