class Event < ActiveRecord::Base
    has_many :users
    #method random event based on phase
end