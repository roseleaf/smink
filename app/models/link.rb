class Link < ActiveRecord::Base
  attr_accessible :long_url, :short_url
  belongs_to :user
  has_many :visits
  validates_uniqueness_of :short_url

end
