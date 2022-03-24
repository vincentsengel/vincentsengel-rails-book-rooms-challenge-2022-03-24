class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy

  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { greater_than: 0 }

  def unavailable_dates
    bookings.pluck(:starts_at, :ends_at).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
