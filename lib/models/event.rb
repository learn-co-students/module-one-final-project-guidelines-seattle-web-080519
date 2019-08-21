class Event < ActiveRecord::Base
    has_many :eventusers
    has_many :users, :through => :eventusers
    #method random event based on phase
end