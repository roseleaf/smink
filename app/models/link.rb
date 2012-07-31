class Link < ActiveRecord::Base
  attr_accessible :long_url, :short_url
  belongs_to :user


end
