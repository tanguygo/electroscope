class AddAddressToOrder < ActiveRecord::Migration
  def change
      add_column :orders, :street_number, :string
      add_column :orders, :route, :string
      add_column :orders, :locality, :string
      add_column :orders, :administrative_area_level_1, :string
      add_column :orders, :postal_code, :string
      add_column :orders, :country, :string
  end
end
