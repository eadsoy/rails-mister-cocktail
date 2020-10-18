class Review < ApplicationRecord
  # belongs_to :cocktail
  validates :text, presence: true
  validates :stars, presence: true
end
