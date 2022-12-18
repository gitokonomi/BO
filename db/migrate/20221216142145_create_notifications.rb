class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :recruiting_id
      t.integer :recruiting_comment_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
    
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :recruiting_id
    add_index :notifications, :recruiting_comment_id
  end
end
