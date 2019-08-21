class Event < ActiveRecord::Base
    has_many :users, :through => :user_event
    #method random event based on phase
end