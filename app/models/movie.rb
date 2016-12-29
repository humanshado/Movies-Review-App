class Movie < ApplicationRecord
  validates :title, :rating, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  def flop?
    total_gross.blank? || total_gross < 300000000
  end

end
