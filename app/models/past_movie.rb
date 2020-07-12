class PastMovie < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: true
  validates :genre, presence: true
  validates :review, length: {maximum: 100}

  def self.search(search)
    return PastMovie.all unless search
    PastMovie.where('title LIKE(?)', "%#{search}%")
  end
end
