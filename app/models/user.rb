class USER < ActiveRecord::Base
    has_secure_password 
    has_many :instruments 
end
