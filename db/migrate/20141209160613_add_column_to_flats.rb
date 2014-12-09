class AddColumnToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :type, :string
  end
end
