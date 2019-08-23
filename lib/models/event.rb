class Event < ActiveRecord::Base
    has_many :users, :through => :eventusers
    attr_accessor :phase_event, :users_choice
    ### Helper Methods ###
    ## Grouping Events by Type ##
    def self.group_have_child
        Event.where event_type: "have child"
    end
    def self.group_user_sick
        Event.where event_type: "user sick"
    end
    def self.group_child_sick
        Event.where event_type: "child sick"
    end
    def self.group_resource_damage
        Event.where event_type: "resource damage"
    end
    def self.group_all_but_sick_kid
        groups_1_2_4_events = []
        groups_1_2_4_events << self.new_child
        groups_1_2_4_events << self.random_user_illness
        groups_1_2_4_events << self.random_resource_damage
        groups_1_2_4_events
    end
    ## END Group Events by Type ##
    ## Get Random Event from Group ##
    def self.new_child
        self.group_have_child.sample
    end
    def self.random_user_illness
        self.group_user_sick.sample
    end
    def self.random_child_illness
        self.group_child_sick.sample
    end
    def self.random_resource_damage
        self.group_resource_damage.sample
    end
    def self.random_event_except_sick_kid
        self.group_all_but_sick_kid.sample
    end
    ## END Get Random Event from Group ##
    def self.user_has_living_child?(user)
        if user.children.find_by alive: true == true
            true
        else
            false
        end
    end
    ### END Helper Methods ###
    # Get an event object based on phase #
    def self.event_occurs(user)
        if user.phase == 1
            @phase_event = self.random_user_illness
        elsif user.phase.between?(2, 6) #=> true if 2-6
            if Event.user_has_living_child?(user) == false
                @phase_event = self.random_event_except_sick_kid
            else
                @phase_event = Event.all.sample
            end
        else
            puts "Error: Phase is not within range."
        end
        # @phase_event = self.random_resource_damage
    end

    def get_users_child(user)
        user.children.find_by(alive: true)
    end

    def self.event_choice(user)
        Eventuser.create({user_id: user.id, event_id: @phase_event.id})

        if self.group_have_child.include?(@phase_event)
            puts @phase_event.definition
            puts "What would you like to name your baby?"
            child_name = gets.chomp
            child_object = child_name.downcase
            child_object = Child.create(name: child_name, alive: true, user_id: user.id)
        elsif self.group_child_sick.include?(@phase_event)
            puts @phase_event.definition
            s(1)
            puts "You may purchase medicine for $#{@phase_event.cost}."
            s(1)
            puts "You currently have $#{user.resources}."
            s(1)
            puts "Without medicine, your child is #{@phase_event.high_chance_damage}% likely to survive."
            s(1)
            puts "With medicine, your child is #{@phase_event.low_chance_damage}% likely to survive."
            s(1)
            puts "Would you like to purchase the medicine?"
            s(1)
            puts "Type Y for Yes or N for No"
            user_response = gets.chomp
            user_response = user_response.downcase!
            @phase_event.choice(user_response, user)
        elsif self.group_user_sick.include?(@phase_event)
            puts @phase_event.definition
            s(1)
            puts "You may purchase medicine for $#{@phase_event.cost}."
            s(1)
            puts "You currently have $#{user.resources}."
            s(1)
            puts "Without medicine, your likelihood of having negative health effects is #{@phase_event.high_chance_damage}%."
            s(1)
            puts "With medicine, your likelihood of having negative health effects is #{@phase_event.low_chance_damage}%."
            s(1)
            puts "Would you like to purchase the medicine?"
            s(1)
            puts "Type Y for Yes or N for No"
            user_response = gets.chomp
            user_response = user_response.downcase!
            @phase_event.choice(user_response, user)
        elsif self.group_resource_damage.include?(@phase_event)
            puts @phase_event.definition
            s(1)
            puts "You must purchase supplies for $#{@phase_event.cost}."
            s(1)
            puts "You currently have $#{user.resources}."
            s(1)
            @phase_event.resource_choice(user)
        else
            puts "Your event object can't be found; broken within Event class method event_choice."
        end
    end

    def resource_choice(user)
        @users_choice = ""
        
        while @users_choice != "y"
            
            puts "Type Y to continue."
            @users_choice = gets.chomp
        end
        user.resources -= self.cost
    end

    def choice(choice_of_user, user)
        choose = @users_choice
        if choose == "y" && user.resources > self.cost
            puts "You are in events.rb > def choice (line 140), if choose == 'y' && user.resources > self.cost."
            # user.resources -= self.cost
            # user.save
            # if rand(100) >= self.low_chance_damage
            #     puts "You were not affected by #{self.name}."
            # else
            #     puts "You were affected by #{self.name}."
            #     puts "Your wellness dropped by #{self.damage}."
            #     user.wellness_score -= self.damage
            #     puts "Your wellness stat is now #{user.wellness_score}."
            #     user.save
            # end
        elsif choose == "y" && user.resources > self.cost && self.group_child_sick.include?(@phase_event)
            "You are in events.rb > def choice (line 140), elsif choose == 'y' && user.resources > self.cost && self.group_child_sick.include?(@phase_event)"
            # user.resources -= self.cost
            # user.save
            # if rand(100) >= self.low_chance_damage
            #     puts "Your child survived #{self.name}!"
            # else
            #     puts "Your child was greatly affected by #{self.name} and has died."
            #     get_users_child(user).alive = false
            #     user.save
            #     get_users_child(user).save
            # end
        elsif choose == "n" && self.group_child_sick.include?(@phase_event)
            "You are in events.rb > def choice (line 140),elsif choose == 'n' && self.group_child_sick.include?(@phase_event)"
            # if rand(100) >= self.high_chance_damage
            #     puts "Your child survived #{self.name}!"
            # else
            #     puts "Your child was greatly affected by #{self.name} and has died."
            #     get_users_child(user).alive = false
            #     user.save
            #     get_users_child(user).save
            # end
        else
            "You are in events.rb > def choice (line 140), else."
            # if rand(100) >= self.high_chance_damage
            #     puts "You were not affected by #{self.name}."
            # else
            #     puts "You were affected by #{self.name}."
            #     puts "Your wellness dropped by #{self.damage}."
            #     user.wellness_score -= self.damage
            #     puts "Your wellness stat is now #{user.wellness_score}."
            #     user.save
            # end
        end
    end
end

