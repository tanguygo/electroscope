class AddFieldsToStatement < ActiveRecord::Migration
  def change
    add_reference :statements, :box_session, index: true
    add_column :statements, :time_of_measure, :datetime
    add_column :statements, :pulse, :float
    add_column :statements, :power, :float
  end
end
