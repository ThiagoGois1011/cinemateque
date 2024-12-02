class Actor < ApplicationRecord
  validates :name, :date_of_birth, :nationality, presence: true
  has_many :movie_papers
end
