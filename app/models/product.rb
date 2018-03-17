class Product < ApplicationRecord
  has_many_attached :photos

  monetize :price_cents, allow_nil: false,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 1000
    }

  before_validation :normalize_price

  private
    def normalize_price
      self.price_cents = Money.from_amount(self.price_cents).fractional
    end
end
