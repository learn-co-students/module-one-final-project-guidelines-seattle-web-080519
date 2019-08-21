class Event < ActiveRecord::Base
    has_many :users
    attr_accessor :phase_event
    attr_reader :have_child_event, :all_user_sick_events, :all_child_sick_events, :all_resource_damage_events
  
    ### Helper Methods ###

    ## Grouping Events by Type ##
    def self.group_have_child
        Event.where event_type: "have child"
    end

    def self.group_user_sick
        Event.where(event_type: "user sick")
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

    ## Get Random Event, but Not Child Illness ##
    
    
    
    ## END Get Random Event, but Not Child Illness ##

    ### END Helper Methods ###

    def self.event_occurs
        if User.phase == 1
            self.random_user_illness
        elsif User.phase.between?(2, 6) #=> true if 2-6
            if User.all.child.count == false
                self.random_event_except_sick_kid.sample
            else
                Event.all.sample
            end
        else
            puts "Error: Phase is not within range."
        end
    end

    #method: Event happens!
        # while phase = 1
            # event = you get sick


        # while phase <= 6 && phase > 1
            # if child == true (Children.each.alive)
                # any event can happen
            # else
                # any event except child getting sick
        # result "phase_event" should then be made available to the CLI to ask the user what to do
    #end

    ### Helper Methods ###

    #method H1 : Lower resources based on Event.cost
    #method H2 : Lower wellness based low_chance_damage outcome
    #method H3 : Lower wellness based high_chance_damage outcome
    #method H4 : Determine child boolean based on low_chance_damage
    #method H5 : Determine child boolean based on high_chance_damage
    #method H6 : Add child to inventory
    
    ### End Helper Methods ###



    #method: Make_a_Choice

        # If Group 1 or Group 4
            # User forced to choose "yes" (i.e., you have no choice or ability to lower the chances of the thing happening)
            
            # If Group 1
                # Add child to inventory
            # If Group 4
                # Adjust resources based on H1
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




end
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
