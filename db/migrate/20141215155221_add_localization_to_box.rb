class AddLocalizationToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :localization, :string #shipping, warehouse or client
  end
end
