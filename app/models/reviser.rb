class Reviser < ApplicationRecord
  belongs_to :user

  has_many :reservations

  # validates :description, presence: true, length: {maximum: 500, minimum:10}
  # validates :average_time, presence: true

  # validates :max_pages, presence: true
  # validates :price_per, presence: true
  # validates :paypal, presence: true




  def reviser_profit
    self.price_per * self.reservations.count
  end
end
