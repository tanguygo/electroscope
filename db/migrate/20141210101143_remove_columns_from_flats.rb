class RemoveColumnsFromFlats < ActiveRecord::Migration
  def change
    remove_column :flats, :avg_monthly_consumption_02
    remove_column :flats, :avg_monthly_consumption_03
    remove_column :flats, :avg_monthly_consumption_04
    remove_column :flats, :avg_monthly_consumption_05
    remove_column :flats, :avg_monthly_consumption_06
    remove_column :flats, :avg_monthly_consumption_07
    remove_column :flats, :avg_monthly_consumption_08
    remove_column :flats, :avg_monthly_consumption_09
    remove_column :flats, :avg_monthly_consumption_10
    remove_column :flats, :avg_monthly_consumption_11
    remove_column :flats, :avg_monthly_consumption_12
  end
end
