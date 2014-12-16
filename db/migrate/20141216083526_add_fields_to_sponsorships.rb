class AddFieldsToSponsorships < ActiveRecord::Migration
  def change
    add_column :sponsorships, :disposal_date, :date
    add_column :sponsorships, :receiver_email, :string
  end
end
