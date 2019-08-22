class User < ActiveRecord::Base
    has_many :children
    has_many :eventusers
    has_many :events, :through => :eventusers
    
    
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
            "Please enter a valid command: 3, 2, or 1."
        end
    end
    def status_report
        #method status report puts welness and resources
        puts "Your wellness stat is #{self.wellness_score}."
        puts "You have $#{self.resources}."
    end
    def age_range
        #method agerange creats age range from phase
        case self.phase
        when 1
            puts "You are between 0 and 5 years old."
        when 2
            puts "You are between 16 and 20 years old."
        when 3
            puts "You are between 21 and 25 years old."
        when 4
            puts "You are between 26 and 30 years old."
        when 5
            puts "You are between 31 and 40 years old."
        when 6
            puts "Welcome to your golden years. You are between 41 and 50 years old."
        end
    end
    def add_sub_resources(dificulty)
         #method addsubresources
        case difficulty
        when "hard"
            hard_earnings = (rand(1..3) - 1)
            self.resources += hard_earnings
            self.save
            puts "You earned $#{hard_earnings}."
            puts "You lost $1 for living expenses."
        when "average"
            average_earnings = (rand(4..15) - 4)
            self.resources += average_earnings
            self.save
            puts "You earned $#{average_earnings}."
            puts "You lost $4 for living expenses."
        when "easy"
            easy_earnings = rand(16..31)
            self.resources += (easy_earnings - 16)
            self.save
            puts "You earned $#{easy_earnings}"
            puts "You lost $16 for living expenses."
        when "super easy"
            money = (rand(32..500) - 32)
            self.resources += money
            self.save
            puts "You earned $#{money}"
            puts "You lost $32 for living expenses."
        end
    end
end