class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,              null: false
      t.text        :item_description,  null: false
      t.integer     :condition,         null: false
      t.integer     :delivery_way,      null: false
      t.integer     :delivery_burden,   null: false
      t.integer     :origin_of_delivery,null: false
      t.integer     :shipment_days,     null: false
      t.integer     :price,             null: false
      t.integer     :size,              null: false
      # t.references  :brand,             foreign_key: true, type: :integer
      # t.references  :saler_id,          null:false ,foreign_key: true, type: :integer
      # t.references  :buyer_id,          null:false ,foreign_key: true, type: :integer
      t.timestamps  null: true
    end
  end
end
