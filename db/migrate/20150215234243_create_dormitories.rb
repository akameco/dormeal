class CreateDormitories < ActiveRecord::Migration
  def change
    create_table :dormitories do |t|
      t.string :name, null: false
      t.string :menu_type, null: false

      t.timestamps null: false
    end
    add_index :dormitories, :name, unique: true
  end
end
