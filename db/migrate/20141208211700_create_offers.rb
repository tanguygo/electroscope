class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.float :price
      t.text :conditions

      t.timestamps
    end
  end
end
