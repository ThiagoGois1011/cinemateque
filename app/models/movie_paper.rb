class MoviePaper < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
  validates :character_name, presence: true
end
