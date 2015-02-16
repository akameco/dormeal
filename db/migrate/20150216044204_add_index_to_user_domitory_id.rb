class AddIndexToUserDomitoryId < ActiveRecord::Migration
  def change
    add_column :users, :dormitory_id, :integer
    add_index :users, :dormitory_id
  end
end
