class ChangeNameTypeToFlats < ActiveRecord::Migration
  def change
    rename_column :flats, :type, :accommodation_type
  end
end
