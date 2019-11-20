class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :saler, class_name: "User",optional: true
  belongs_to :category, optional: true
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
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :name, presence: true,length: {in: 1..40}
  validates :item_description, presence: true, length: {in: 1..1000}
  validates :category_id, presence: true
  validates :clothes_size_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_way_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_days_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :images, presence: true
end
