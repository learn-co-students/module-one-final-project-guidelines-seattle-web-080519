require_relative '../config/environment'
puts "ARE YOU READY TO BE BORN?"
puts "how easy is your life goin to be"
dificulty = gets.chomp
puts "What is your name?"
username = gets.chomp
new_user = User.create_user(username, dificulty) #take out username crzy characters
# new_user.status_report


new_user.age_range # puts "phase 1"

# #start loop
# def game_loops
#     while user.phase < 6 do
#         # if user.wellness > 0 
#         puts status_report #status report method in user 
#         gets continue?
#         if no = dead
#         if yes continue
#         puts agerange #agerange method in user
#         puts resources up and down #method in user 
#         puts event #get random event form events.all based on phase
#         gets choice
#         events_choice #method in events
#         #method changestats
#         puts status_report
#         if user.wellness < 1
#             return dead? = true
#         else puts you servived this phase 
#         user.phase += 1
#         end
#     end
#     if dead 
#         youlost
#     else
#         you win
#     end
#     puts score
# end
