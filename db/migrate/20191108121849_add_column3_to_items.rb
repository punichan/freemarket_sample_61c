class AddColumn3ToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :image_id, :integer, null: false, index: true, foreign_key: true
  end
end
