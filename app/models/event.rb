class Event < ApplicationRecord
	belongs_to :location
	validates_presence_of :title
    validates_presence_of :location
    validates_presence_of :date
end
