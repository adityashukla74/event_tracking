class Event < ApplicationRecord
	belongs_to :location
	has_many :attendRsvps
 +  has_many :users, :through => :attendRsvps
end
