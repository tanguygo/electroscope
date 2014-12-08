class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.references :devicetype, index: true
      t.references :flat, index: true

      t.timestamps
    end
  end
end
