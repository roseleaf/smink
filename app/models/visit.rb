class Visit < ActiveRecord::Base
  # attr_accessible :title, :body
  belong_to :link
end
