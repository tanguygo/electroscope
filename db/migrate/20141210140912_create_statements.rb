class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|

      t.timestamps
    end
  end
end
