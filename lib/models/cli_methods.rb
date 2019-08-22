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