class Event < ActiveRecord::Base
    has_many :users, :through => :eventusers
    attr_accessor :phase_event
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
        self.group_have_child[0]
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
    # user makes a choice
    # def eventchoice(event_instance)
    #         if event_group_sickness.include(event_instance)
    #                 code clodejlkajdf
    #         elsif other event group code to make that happenend
    #         end
    def self.event_choice(user)
        Eventuser.create({user_id: user.id, event_id: @phase_event.id})
        if self.group_have_child.include?(@phase_event)
            puts @phase_event.definition
            puts "What would you like to name your baby?"
            child_name = gets.chomp
            child_object = child_name.downcase
            child_object = Child.create(name: child_name, alive: true, user_id: user.id)
        elsif self.group_user_sick.include?(@phase_event)
            puts @phase_event.definition
            s(1)
            puts "You may purchase medicine for $#{@phase_event.cost}."
            s(1)
            puts "You currently have $#{user.resources}."
            s(1)
            puts "Without medicine, your survival rate is #{@phase_event.high_chance_damage}%."
            s(1)
            puts "With medicine, your survival rate is #{@phase_event.low_chance_damage}%."
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
        users_choice = "NO!"
        
        while users_choice != "y"
            
            puts "Type Y to continue."
            users_choice = gets.chomp
            # users_choice.downcase!
        #     users_choice = gets_choice
            # break if users_choice == "y"
        end
        user.resources -= self.cost
    end

    def choice(choose, user)
        if choose == "y" && user.resources > self.cost
            user.resources -= self.cost
            user.save
            if rand(100) >= self.low_chance_damage
                puts "You were not affected by #{self.name}."
            else
                puts "You were affected by #{self.name}."
                puts "Your wellness dropped by #{self.damage}."
                user.wellness_score -= self.damage
                puts "Your wellness stat is now #{user.wellness_score}."
                user.save
            end
        else
            if rand(100) >= self.high_chance_damage
                puts "You were not affected by #{self.name}."
            else
                puts "You were affected by #{self.name}."
                puts "Your wellness dropped by #{self.damage}."
                user.wellness_score -= self.damage
                puts "Your wellness stat is now #{user.wellness_score}."
                user.save
            end
        end
    end

    # def self.gets_choice
    #     puts "Type Y to continue."
    #     user_response = gets.chomp
    #     user_response.downcase!
    # end
end

