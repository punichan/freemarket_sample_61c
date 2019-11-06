class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand_id, :integer, foreign_key: true
    add_column :items, :saler_id, :integer, null: false, index: true, foreign_key: true
    add_column :items, :buyer_id, :integer, null: false, index: true, foreign_key: true
  end
end
