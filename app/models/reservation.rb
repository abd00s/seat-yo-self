class Reservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :restaurant

  validate :availability

  private
  def availability
    unless restaurant.available?(size, time)
      errors.add(:base, "Restaurant is full at this hour")
    end
  end
end
