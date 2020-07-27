class PastMovie < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one_attached :image
  belongs_to :user
  has_many :group_past_movies, dependent: :destroy
  has_many :groups, through: :group_past_movies

  validates :title, presence: true
  validates :genre, presence: true
  validates :review, length: {maximum: 100}
  validates :image, presence: true

  def self.search(search)
    return PastMovie.all unless search
    PastMovie.where('title LIKE(?)', "%#{search}%")
  end
end
