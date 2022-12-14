class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :introduction, :text
    add_column :users, :is_deleted, :boolean, null: false, default: false
  end
end
