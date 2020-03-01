class User < ApplicationRecord
  
  
  has_many :blogs
  validates :name, presence: true, length: { maximum: 20 }
  validates :email,presence: true, length: { maximum: 30 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
 
            
  before_validation { email.downcase! }
  
  has_secure_password
  validates :password_digest, presence:true, length: {minimum: 4}
  
  
 
end
