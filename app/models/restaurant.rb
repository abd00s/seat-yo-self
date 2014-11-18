class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :customers, through: :reservations


  validates :name, :address, :description, presence: true
end
