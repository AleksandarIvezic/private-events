class Event < ApplicationRecord

    belongs_to :creator, class_name: "User"
    has_many :event_attendings, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendings

    def self.past
        where("event_date < ?", DateTime.now) 
    end

    def self.upcoming 
        where("event_date > ?", DateTime.now)
    end
end
