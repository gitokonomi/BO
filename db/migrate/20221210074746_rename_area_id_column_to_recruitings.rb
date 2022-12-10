class RenameAreaIdColumnToRecruitings < ActiveRecord::Migration[6.1]
  def change
    rename_column :recruitings, :area_id, :prefecture_id
  end
end
