require_relative '../config/environment'

toby = User.create(name: "Toby", phase: 2)

user = toby

Event.event_occurs(user)

Event.event_choice(user)

# puts "ARE YOU READY TO BE BORN?"
# puts "easy is your life goin to be"
# dificulty = gets.chomp
# puts "What is your name?"
# username = gets.chomp.to_s
# new_user = User.create_user(username, dificulty) #take out username crzy characters
# # new_user.status_report




# # #start loop
#     $dead = false
#     while new_user.phase < 7 do
#         puts "welcome to phase #{new_user.phase}"# puts "phase 1"
#         new_user.age_range  #puts agerange #agerange method in user
#         new_user.status_report #puts status_report #status report method in user
#         do_you_want_to_continue
#         break if $dead == true  #if no = dead #if yes continue
#         new_user.add_sub_resources(dificulty)
#         survived_phase(new_user)
#     end
#     if $dead == true
#         puts "game over!!!"
#     else
#         puts "you survived the game"
#     end

# #         puts event #get random event form events.all based on phase
# #         gets choice
# #         events_choice #method in events
# #         #method changestats
# #         puts status_report