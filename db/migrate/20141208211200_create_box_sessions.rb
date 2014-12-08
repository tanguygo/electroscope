class CreateBoxSessions < ActiveRecord::Migration
  def change
    create_table :box_sessions do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :flat, index: true
      t.references :box, index: true

      t.timestamps
    end
  end
end
