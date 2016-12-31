class Review < ApplicationRecord
  validates :name, presence: true
  validates :comment, length: { minimum: 25 }

  belongs_to :movie
end
