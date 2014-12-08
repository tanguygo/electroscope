class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :type
      t.float :avg_daily_consumption
      t.float :avg_monthly_consumption_01
      t.float :avg_yearly_consumption

      t.timestamps
    end
  end
end
