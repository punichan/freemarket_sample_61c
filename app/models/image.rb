class Image < ApplicationRecord
  mount_uploader :images, ImageUploader
  belongs_to :item
  validates :images, presence: true
end
