class AddFieldsToFlats < ActiveRecord::Migration
  def change
      add_column :flats, :street_number, :string
      add_column :flats, :route, :string
      add_column :flats, :locality, :string
      add_column :flats, :administrative_area_level_1, :string
      add_column :flats, :postal_code, :string
      add_column :flats, :country, :string
      add_column :flats, :number_of_occupants, :integer
      add_column :flats, :surface, :float
      add_column :flats, :latitude, :float
      add_column :flats, :longitude, :float
      add_column :flats, :last_yearly_bill, :float
  end
end
