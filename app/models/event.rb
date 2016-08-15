class Event < ApplicationRecord
	belongs_to :location
	has_many :attendRsvps
    has_many :users, :through => :attendRsvps
 	validates_presence_of :title
end
