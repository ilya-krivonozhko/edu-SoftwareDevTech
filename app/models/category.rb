class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name,
          presence: true,
          uniqueness: { case_sensitive: false },
          length: { minimum: 2, maximum: 50 }
end
