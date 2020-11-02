class User < ActiveRecord::Base
    has_many :instruments 
    has_secure_password
    validates :username, :password, presence: true 
    validates :username, uniqueness: true 
end
