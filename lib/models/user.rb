class User < ActiveRecord::Base
    has_many :children
    has_many :events, :through => :users_event
    
    
    #method addsubresources
    def self.create_user(name, dificulty) #uniq usernames
        case dificulty
        when "hard"
            new_user = User.create({:phase => 1, :name => name, :wellness_score => rand(50..65), :resources => rand(1..3)})
        when "average"
            new_user = User.create({:phase => 1, :name => name, :wellness_score => rand(65..75), :resources => rand(4..15)})
        when "easy"
            new_user = User.create({:phase => 1, :name => name, :wellness_score => rand(70..80), :resources => rand(16..31)})
        when "super easy"
            new_user = User.create({:phase => 1, :name => name, :wellness_score => rand(75..90), :resources => rand(32..500)})
        else
            "please enter a valid command 'hard, average, easy"
        end
    end
    def status_report
        #method status report puts welness and resources
        puts "your wellness stat is #{self.wellness_score}"
        puts "you have $#{self.resources}"
    end
    def age_range
        #method agerange creats age range from phase
        case self.phase
        when 1
            puts "you are 0 between and 5"
        when 2
            puts "you are 16 and 20"
        when 3
            puts "you are between 21 and 25"
        when 4
            puts "you are between 26 and 30"
        when 5
            puts "you are between 31 and 40"
        when 6
            puts "you are between 41 and 50"
        end
    end
    def add_sub_resources(dificulty)
         #method addsubresources
        case dificulty
        when "hard"
            hard_earnings = rand(1..3)
            self.resources += hard_earnings
            self.resources -= 1
            puts "you earned $#{hard_earnings}"
            puts "you lost $1"
        when "average"
            average_earnings = rand(4..15)
            self.resources += average_earnings
            self.resources -= 4
            puts "you earned $#{average_earnings}"
            puts "you lost $4"
        when "easy"
            easy_earnings = rand(16..31)
            self.resources += easy_earnings
            self.resources -= 16
            puts "you earned $#{easy_earnings}"
            puts "you lost $16"
        when "super easy"
            money = rand(32..500)
            self.resources += money
            self.resources -= 32
            puts "you earned $#{money}"
            puts "you lost $32"
        end
    end
end