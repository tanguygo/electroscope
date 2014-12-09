class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :electroscope_id

      t.timestamps
    end
  end
end
