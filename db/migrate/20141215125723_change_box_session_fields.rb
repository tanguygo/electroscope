class ChangeBoxSessionFields < ActiveRecord::Migration
  def change
    remove_column :box_sessions, :status
    add_column :box_sessions, :connected, :boolean
    add_column :box_sessions, :activated, :boolean
  end
end
