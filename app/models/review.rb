class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comment, length: { minimum: 25 }

  # STARS = ['1', '2', '3', '4', '5']
  #
  # validates :stars, inclusion: { in: STARS }



end
