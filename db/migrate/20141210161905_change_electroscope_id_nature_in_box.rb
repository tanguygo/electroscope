class ChangeElectroscopeIdNatureInBox < ActiveRecord::Migration
  def change
    change_column :boxes, :electroscope_id,  :string
  end
end
