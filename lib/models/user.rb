class User < ActiveRecord::Base
    has_many :children
    has_many :events, :through => :user_event
end