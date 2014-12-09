class AddAddressComplementToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address_complement, :string
  end
end
