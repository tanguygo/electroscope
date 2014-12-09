class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :street_number
    remove_column :users, :route
    remove_column :users, :locality
    remove_column :users, :administrative_area_level_1
    remove_column :users, :postal_code
    remove_column :users, :country
  end
end
