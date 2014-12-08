class AddUserToFlat < ActiveRecord::Migration
  def change
    add_reference :flats, :user, index: true
  end
end
