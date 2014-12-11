class ChangeColumnNameInBox < ActiveRecord::Migration
  def change
    rename_column :boxes, :electroscope_id,  :internal_ref
  end
end
