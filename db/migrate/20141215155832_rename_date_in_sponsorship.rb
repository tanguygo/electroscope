class RenameDateInSponsorship < ActiveRecord::Migration
  def change
    rename_column :sponsorships, :date, :date_reception
  end
end
