class Event < ActiveRecord::Base
    has_many :users
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
        @phase_event = self.random_user_illness
    end

    # user makes a choice
    

    # def eventchoice(event_instance)
    #         if event_group_sickness.include(event_instance)
    #                 code clodejlkajdf
    #         elsif other event group code to make that happenend
    #         end



    def self.event_choice(user)
        if self.group_have_child.include?(@phase_event)
            puts @phase_event.definition
            puts "What would you like to name your baby?"
            child_name = gets.chomp
            child_object = child_name.downcase
            child_object = Child.create(name: child_name, alive: true, user_id: user.id)
        elsif self.group_user_sick.include?(@phase_event)
            puts @phase_event.definition
            puts "You may purchase medicine for $#{@phase_event.cost}."
            puts "You currently have $#{user.resources}"
            puts "Without medicine, your survival rate is #{@phase_event.high_chance_damage}"
            puts "With medicine, your survival rate is #{@phase_event.low_chance_damage}%" 

            puts "Would you like to purchase the medicine?"
            puts "Type Y for Yes or N for No"
            user_response = gets.chomp
            user_response = user_response.downcase!
              
            if user_response == "y"
                puts "you put yes"
                
            elsif user_response == "n"
                puts "you put no"

            else
                puts "Your code is broken within the Event.event_choice(user) method under elsif self.group_user_sick."
            end

        
        # elsif self.group_child_sick.include?(@phase_event)

        # elsif self.group_resource_damage.include?(@phase_event)

        else
            puts "Your event object can't be found; broken within Event class method event_choice."
        end


    end

end
        # If Group 1
            # User asked to name child
            # Create child


        # If Group 2:
            # Get user's input if they want medicine to lower the damage rate


            
            # If Yes
                # Adjust cost based on Event.cost (H1) & adjust wellness based on method (H2)
            # If No 
                # Adjust wellness based on method (H3)
        # If Group 3:
            # Get user's input if they want medicine to lower the damage rate
            # If Yes
                # Adjust cost based on Event.cost (H1) & adjust child status based on method (H4)
            # If No 
                # Adjust child status based on method (H5)
        # If Group 4
            # User forced to choose "yes" (i.e., you have no choice or ability to lower the chances of the thing happening)        
            # Adjust resources based on H1
                 






    ### Helper Methods ###

    #method H1 : Lower resources based on Event.cost
    #method H2 : Lower wellness based low_chance_damage outcome
    #method H3 : Lower wellness based high_chance_damage outcome
    #method H4 : Determine child boolean based on low_chance_damage
    #method H5 : Determine child boolean based on high_chance_damage
    #method H6 : Add child to inventory
    
    ### End Helper Methods ###








  # group 1:
    # Have child
  # group 2:
    # Get sick
        # Malaria
        # HIV
        # Other infection
  # group 3:
    # Child gets sick
        # Malaria
        # Injury
        # Other infection
  # group 4:
    # Resource damage
        # Famine
        # Drought
        # House Repair
