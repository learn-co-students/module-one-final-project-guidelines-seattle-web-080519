require_relative '../config/environment'

puts "Welcome to the Survival Game!"
puts "Created by Jared Burnam and Genevieve McAllister"
puts "Based on the book Factfulness by Hans Rosling."
puts ""

puts "ARE YOU READY TO BE BORN?"
puts ""
s(1)

puts "How easy will your life be?"
s(1)
difficulty = dificulty_check


puts "You've chosen #{difficulty}. Let's go!"
s(1)

puts ""

puts "What is your name?"
username = gets.chomp.to_s
puts ""
puts "Welcome to the world, #{username}!"
new_user = User.create_user(username, difficulty) #take out username crzy characters
s(1)

# print "The world has four income levels, and you are born into a country on Level 1. "
# s(1)
# print "About 1 billion of your fellow humans live on this level; "
# s(1)
# print "that's 9% of the world's population."
# s(1)
# print "(While that's still too many people struggling, that's a huge improvement: "
# s(1)
# puts "in 1966, 50% of the world was on Level 1.) "
# s(1)
# puts ""
# print "Most people in your country survive on under $2 a day. "
# s(1)
# print "As a child, you will walk barefoot to a mudhole to collect water for your family using your single plastic bucket. "
# s(1)
# puts "On your way home you'll gather firewood to heat the gray porridge that you eat at every meal. "

tension

    @dead = false
    # binding.pry
    while new_user.phase < 7 do
        puts "Welcome to phase #{new_user.phase}!"
        s(2)
        new_user.age_range
        s(2)
        new_user.status_report
        s(2)
        do_you_want_to_continue if new_user.phase >= 2
        break if @dead == true
        new_user.add_sub_resources(difficulty)
        s(1)
        Event.event_occurs(new_user)
        Event.event_choice(new_user)
        survived_phase(new_user)
        break if @dead == true
    end
    if @dead == true
        puts "Game over!"
    else
        puts "You have survived to age 50 and completed the game!"
    end
    k = new_user.events.all
    k.each {|e| puts e.name}