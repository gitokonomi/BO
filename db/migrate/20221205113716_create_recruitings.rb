class CreateRecruitings < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitings do |t|
      t.integer :user_id, null: false
      t.integer :area_id, null: false
      t.string :title, null: false
      t.datetime :date, null: false
      t.string :place, null: false
      t.datetime :deadline, null: false
      t.text :body, null: false
      t.boolean :is_matched, null: false, default: false

      t.timestamps
    end
  end
end
