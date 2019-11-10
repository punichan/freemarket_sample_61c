class Image < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :item
end
