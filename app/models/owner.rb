class Owner < User
  has_many :restaurants
  def self.model_name
    User.model_name
  end	
end