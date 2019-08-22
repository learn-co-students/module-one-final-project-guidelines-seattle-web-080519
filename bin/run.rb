require_relative '../config/environment'

puts "Are you ready to be born?"
s(1)
print "."
s(1)
print "."
s(1)
puts "."
s(1)

puts "How easy will your life be?"
s(1)
puts "Select 1 for hard."
puts "Select 2 for average."
puts "Select 3 for easy."

difficulty = gets.chomp
puts "You've chosen #{difficulty}. Let's go!"
s(1)

puts ""

puts "The world has four income levels, and you are born into a country on Level 1. About 1 billion of your fellow humans live on this level; that's 8% of the world's population. Most people in your country survive on under $2 a day. As a child, you will walk barefoot to a mudhole to collect water for your family using your single plastic bucket. On your way home you'll gather firewood to heat the gray porridge that you eat at every meal."

"What is your name?"
username = gets.chomp.to_s
puts username
s(1)
new_user = User.create_user(username, dificulty) #take out username crzy characters

    @dead = false
    while new_user.phase < 7 do
        puts "welcome to phase #{new_user.phase}"
        s(1)
        new_user.age_range
        s(1)
        new_user.status_report
        s(1)
        do_you_want_to_continue if new_user.phase >= 2
        break if @dead == true
        new_user.add_sub_resources(dificulty)
        s(1)
        Event.event_occurs(new_user)
        Event.event_choice(new_user)
        survived_phase(new_user)
        system 'clear'
    end
    if @dead == true
        puts "game over!!!"
    else
        puts "you survived the game"
    end
    k = new_user.events.all
    k.each {|e| puts e.name}