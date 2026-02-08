class Product < ApplicationRecord
  belongs_to :category

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 100 }

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
end
