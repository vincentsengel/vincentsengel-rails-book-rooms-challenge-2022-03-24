class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :check_dates_consistency

  private

  def check_dates_consistency
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end

    if Date.parse(starts_at) < Date.today
      errors.add(:starts_at, "must be in the future !")
    end

    if Date.parse(ends_at) < Date.today
      errors.add(:ends_at, "must be in the future !")
    end
  end
end
