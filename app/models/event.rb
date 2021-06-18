class Event < ApplicationRecord
    validates :title, presence: true
    validates :details, presence: true
    validates :event_date, presence: true
    belongs_to :creator, class_name: "User"
    has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :event_attendings
    scope :past, -> {where("event_date < ?", DateTime.now)}
    scope :upcoming, -> {where("event_date > ?", DateTime.now)}

    # def self.past
    #     where("event_date < ?", DateTime.now) 
    # end

    # def self.upcoming 
    #     where("event_date > ?", DateTime.now)
    # end
end
