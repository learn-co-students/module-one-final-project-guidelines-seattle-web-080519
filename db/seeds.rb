  # group 1:
    # Have girl
        # 2%
        have_child_g1 = Event.create(:name => "have child", :definition => "Congratulations, you have a new baby girl! Do your best to keep her alive.", :cost => nil, :low_chance_damage => nil, :high_chance_damage => nil, :damage => nil, :event_type => "have child")
    # Have girl
        # 2%
        have_child_g2 = Event.create(:name => "have child", :definition => "Congratulations, you have a new baby girl! Do your best to keep her alive.", :cost => nil, :low_chance_damage => nil, :high_chance_damage => nil, :damage => nil, :event_type => "have child")
    # Have boy
        # 2%
        have_child_b1 = Event.create(:name => "have child", :definition => "Congratulations, you have a new baby boy! Do your best to keep him alive.", :cost => nil, :low_chance_damage => nil, :high_chance_damage => nil, :damage => nil, :event_type => "have child")
    # Have boy
        # 2%
        have_child_b2 = Event.create(:name => "have child", :definition => "Congratulations, you have a new baby boy! Do your best to keep him alive.", :cost => nil, :low_chance_damage => nil, :high_chance_damage => nil, :damage => nil, :event_type => "have child")
  # group 2:
    # Get sick
        # Malaria
            # 43%
            # 13%
            # sick_malaria = Event.create(:name => "malaria", :definition => "You've contracted malaria.", :cost => 1, :low_chance_damage => 13, :high_chance_damage => 43, :damage => 20, :event_type => "user sick")
        # HIV
            # 90%
            # 40%
            # sick_hiv = Event.create(:name => "HIV", :definition => "You've contracted HIV.", :cost => 3, :low_chance_damage => 40, :high_chance_damage => 90, :damage => 50, :event_type => "user sick")
        # Other infection
            # 80%
            # 10%
            sick_infection = Event.create(:name => "infection", :definition => "You have an infection.", :cost => 1, :low_chance_damage => 10, :high_chance_damage => 80, :damage => 10, :event_type => "user sick")
  # group 3:
    # Child gets sick
        # Malaria
            # 43%
            # 13%
            child_malaria = Event.create(:name => "malaria", :definition => "Your child has contracted malaria.", :cost => 1, :low_chance_damage => 13, :high_chance_damage => 43, :damage => nil, :event_type => "child sick")
        # Injury
            # 50%
            # 14%
            child_injury = Event.create(:name => "injury", :definition => "Your child has been injured.", :cost => 2, :low_chance_damage => 14, :high_chance_damage => 50, :damage => nil, :event_type => "child sick")
        # Other infection
            # 80%
            # 10%
            child_infection = Event.create(:name => "infection", :definition => "Your child has an infection.", :cost => 1, :low_chance_damage => 10, :high_chance_damage => 80, :damage => nil, :event_type => "child sick")
#   # group 4:
#     # Resource damage
#         # Famine
#             # 100%
#             # 100%
#             famine = Event.create(:name => "famine", :definition => "There's a famine that has damaged your crops; you'll need to purchase food.", :cost => 2, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")
#         # Drought
#             # 100%
#             # 100%
#             drought = Event.create(:name => "drought", :definition => "There's a drought that has dried out your well; you'll need to purchase water.", :cost => 3, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")
#         # Home Repairs
#             # 100%
#             # 100%
#             home_repairs = Event.create(:name => "home repair costs", :definition => "A tree fell on your house; you'll need to repair it.", :cost => 1, :low_chance_damage => 100, :high_chance_damage => 100, :damage => nil, :event_type => "resource damage")



    