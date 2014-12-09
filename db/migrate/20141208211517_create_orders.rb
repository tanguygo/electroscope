class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :creation_date
      t.string :status
      t.string :counter_type
      t.string :delivery_option
      t.references :offer, index: true
      t.references :box, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
