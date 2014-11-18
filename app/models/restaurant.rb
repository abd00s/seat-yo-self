class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :customers, through: :reservations
  belongs_to :owner

  validates :name, :address, :description, presence: true

  def available?(size,time)
    reserved = reservations.where(time: time).sum(:size)
    size <= (capacity - reserved)
  end
end
