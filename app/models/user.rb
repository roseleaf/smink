class User < ActiveRecord::Base
  has_many :links
  # attr_accessible :title, :body
end
