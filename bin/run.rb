require_relative '../config/environment'

puts "ARE YOU READY TO BE BORN?"
s(1)
puts "how easy is your life goin to be"
puts "hard"
puts "average"
puts "easy"
dificulty = gets.chomp
puts dificulty
s(1)
puts "What is your name?"
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