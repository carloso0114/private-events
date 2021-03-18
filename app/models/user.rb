class User < ApplicationRecord
    has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
    has_many :attendances, foreign_key: 'attendee'
    has_many :attended_events, through: 'attendances', class_name: 'Event'
end
