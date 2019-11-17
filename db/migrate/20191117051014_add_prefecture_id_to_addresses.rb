class AddPrefectureIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture_id, :integer, foreign_key: true, null: false
  end
end
