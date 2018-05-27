class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  #validates :user_id, presence: true


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
