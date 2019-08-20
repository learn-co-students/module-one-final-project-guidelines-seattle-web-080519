class User < ActiveRecord::Base
    has_many :children
    has_many :events, :through => :user_event
    #method status report puts welness and resources
    #method agerange creats age range from phase
    #method addsubresources
    
end