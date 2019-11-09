class AddCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id, :integer, foreign_key: true, null: false, index: true
    add_column :items, :shoes_size_id, :integer, foreign_key: true
    add_column :items, :clothes_size_id, :integer, foreign_key: true
    add_column :items, :condition_id, :integer, foreign_key: true, null: false
    add_column :items, :delivery_way_id, :integer, foreign_key: true, null: false
    add_column :items, :delivery_burden_id, :integer, foreign_key: true, null: false
    add_column :items, :prefecture_id, :integer, foreign_key: true, null: false
    add_column :items, :shipment_days_id, :integer, foreign_key: true, null: false
    add_column :items, :buyer_id, :integer, foreign_key: true, index: true
  end
end
