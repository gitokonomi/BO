class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.integer :user_id, null: false
      t.integer :prefecture_id, null: false

      t.timestamps
    end
  end
end
