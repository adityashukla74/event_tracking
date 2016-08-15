class Event < ApplicationRecord
	belongs_to :location
	has_many :userRsvps
 +  has_many :users, :through => :userRsvps
end
