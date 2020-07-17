class GroupPastMovie < ApplicationRecord
  belongs_to :group
  belongs_to :past_movie
end
