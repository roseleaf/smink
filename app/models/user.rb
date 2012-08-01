class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email,  :password, :password_confirmation, :password_salt, :persistence_token, :username
  acts_as_authentic
end
