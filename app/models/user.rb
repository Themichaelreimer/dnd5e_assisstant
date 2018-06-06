class User < ApplicationRecord
  #validates :name, :presence => true, :length => {:in 1..30}
  has_secure_password
end
