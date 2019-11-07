class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id,      null: false, foreign_key: true
      t.string  :postal_code,  null: false
      t.integer :prefecture,   null: false
      t.string  :city,         null: false
      t.string  :town,         null: false
      t.string  :building
      t.timestamps
    end
  end
end
