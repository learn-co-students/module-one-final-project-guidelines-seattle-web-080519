def dificulty_check
    dificulty = ""
    while 
        dificulty = gets_dificulty
        break if dificulty == "1" || dificulty == "2" || dificulty == "3" || dificulty == "4"
    end
    dificulty
end
def gets_dificulty
    puts "Select 1 for hard."
    puts "Select 2 for average."
    puts "Select 3 for easy."
    d = gets.chomp
    d.to_s
end
def tension
    print "."
    s(1)
    print "."
    s(1)
    puts "."
    s(1)
end
def survived_phase(user) 
    if user.wellness_score < 1
        dead = true
        return dead
    else 
        puts "You have survived phase #{user.phase}." 
        user.phase += 1
    end
end
def do_you_want_to_continue
    puts "Do you want to keep playing?"
    input = gets.chomp
    if input == "n"
        puts "You've given up on life and family."
        @dead = true
    end
end
def s(f) 
    sleep f
end