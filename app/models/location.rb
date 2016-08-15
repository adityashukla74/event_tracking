class Location < ApplicationRecord
	belongs_to :event, optional: true
	has_many :events
end
