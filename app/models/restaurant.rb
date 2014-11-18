class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :customers, through: :reservations
  belongs_to :owner


  validates :name, :address, :description, presence: true
end
