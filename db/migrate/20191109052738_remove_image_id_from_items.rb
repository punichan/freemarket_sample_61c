class RemoveImageIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image_id, :integer
    remove_column :items, :category_id, :integer
    remove_column :items, :buyer_id, :integer
    remove_column :items, :size, :integer
    remove_column :items, :shipment_days, :integer
    remove_column :items, :origin_of_delivery, :integer
    remove_column :items, :delivery_burden, :integer
    remove_column :items, :delivery_way, :integer
    remove_column :items, :condition, :integer
  end
end
