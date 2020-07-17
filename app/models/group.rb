class Group < ApplicationRecord
  belongs_to :user
  has_many :group_past_movies, dependent: :destroy
  has_many :past_movies, through: :group_past_movies
  
  validates :name, presence: true
end
