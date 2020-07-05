class PastMovie < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.search(search)
    return PastMovie.all unless(search)
    PastMovie.where('title LIKE(?)', "%#{search}%")
  end
end
