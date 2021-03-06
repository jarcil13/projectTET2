class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :markers	
  before_create -> {self.api_token = generate_token}

  private
 
  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({api_token: token})
    end
  end
end
