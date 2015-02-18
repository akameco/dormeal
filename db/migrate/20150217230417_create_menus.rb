class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menu_type, null: false
      t.string :breakfast_j
      t.string :breakfast_w
      t.string :dinner
      t.date :open_day

      t.timestamps null: false
    end
    add_index :menus, :menu_type
    add_index :menus, :open_day
  end
end
