def survived_phase(user) 
    if user.wellness_score < 1
        dead = true
        return dead
    else 
        puts "you servived phase: #{user.phase}" 
        user.phase += 1
    end
end
def do_you_want_to_continue
    puts "do you want to keep playing?"
    input = gets.chomp
    if input == "n"
        puts "you gave up on life and family"
        $dead = true
    end
end