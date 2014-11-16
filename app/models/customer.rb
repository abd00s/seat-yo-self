class Customer < User
  has_many :reservations
  has_many :restaurants, through: :reservations
  def self.model_name
    User.model_name
  end	
end