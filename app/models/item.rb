class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipment_days
  belongs_to_active_hash :shoes_size
  belongs_to_active_hash :clotes_size
  belongs_to_active_hash :condition
end
