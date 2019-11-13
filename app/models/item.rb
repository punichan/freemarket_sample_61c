class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :category
  belongs_to :brand, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipment_days
  belongs_to_active_hash :shoes_size
  belongs_to_active_hash :clothes_size
  belongs_to_active_hash :condition
  #オプション（dependent: :destroy)で日記が消えたらそれに関連する画像も消える設定
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
end
