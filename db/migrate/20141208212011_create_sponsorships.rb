class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.datetime :date
      t.string :status
      t.references :box, index: true

      t.timestamps
    end
  end
end
