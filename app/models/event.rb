class Event < ApplicationRecord
	belongs_to :location
	validates_presence_of :title
    validates_presence_of :date
    validates_presence_of :location
end
