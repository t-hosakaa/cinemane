class NewMovie < ApplicationRecord
  mount_uploader :image, ImageUploader
end
