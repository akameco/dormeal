class AddIndexToMenutypeDate < ActiveRecord::Migration
  def change
    add_index :menus, [:menu_type, :open_day], :unique => true
  end
end
