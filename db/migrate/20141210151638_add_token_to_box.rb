class AddTokenToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :token, :string
  end
end
