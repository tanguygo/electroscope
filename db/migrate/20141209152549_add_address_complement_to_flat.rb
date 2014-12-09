class AddAddressComplementToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :address_complement, :string
  end
end
