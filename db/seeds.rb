# create_table "events", force: :cascade do |t|
    # t.string  "name"
    # t.string  "definition"
    # t.integer "cost"
    # t.integer "low_chance_damage"
    # t.integer "high_chance_damage"
    # t.integer "damage"
    # t.string "event_type"
#   end


  # group 1:
    # Have child
        # 2%
        have_child = Event.create(:name => "have child", :definition => "Congratulations, you have a new baby! Do your best to keep them alive.", :cost => nil, :low_chance_damage => nil, :high_chance_damage => nil, :damage => nil, :event_type => "have child")
  # group 2:
    # Get sick
        # Malaria
            # 43%
            # 13%
            sick_malaria = Event.create(:name => "user sick: malaria", :definition => "You've contracted malaria.", :cost => 1, :low_chance_damage => 13, :high_chance_damage => 43, :damage => 2, :event_type => "user sick")
        # HIV
            # 90%
            # 40%
            sick_hiv = Event.create(:name => "user sick: HIV", :definition => "You've contracted HIV.", :cost => 3, :low_chance_damage => 40, :high_chance_damage => 90, :damage => 5, :event_type => "user sick")
        # Other infection
            # 80%
            # 10%
            sick_infection = Event.create(:name => "user sick: infection", :definition => "You have an infection.", :cost => 1, :low_chance_damage => 10, :high_chance_damage => 80, :damage => 1, :event_type => "user sick")
  # group 3:
    # Child gets sick
        # Malaria
            # 43%
            # 13%
            child_malaria = Event.create(:name => "child sick: malaria", :definition => "You've contracted malaria.", :cost => 1, :low_chance_damage => 13, :high_chance_damage => 43, :damage => nil, :event_type => "child sick")
        # Injury
            # 50%
            # 14%
            child_injury = Event.create(:name => "child sick: injury", :definition => "Your child has been injured.", :cost => 2, :low_chance_damage => 14, :high_chance_damage => 50, :damage => nil, :event_type => "child sick")
        # Other infection
            # 80%
            # 10%
            child_infection = Event.create(:name => "child sick: infection", :definition => "Your child has an infection.", :cost => 1, :low_chance_damage => 10, :high_chance_damage => 80, :damage => nil, :event_type => "child sick")
  # group 4:
    # Resource damage
        # Famine
            # 100%
            # 100%
            famine = Event.create(:name => "famine", :definition => "There's a famine that has damaged your crops; you'll need to purchase food.", :cost => 2, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")
        # Drought
            # 100%
            # 100%
            drought = Event.create(:name => "drought", :definition => "There's a drough that has dried out your well; you'll need to purchase water.", :cost => 3, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")
        # Home Repairs
            # 100%
            # 100%
            home_repairs = Event.create(:name => "home repair", :definition => "A tree fell on your house; you'll need to repair it.", :cost => 1, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")



    