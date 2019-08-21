require_relative '../config/environment'

def welcome
    p "Welcome to Brewery Go where you can"
  end
  
  def get_character_from_user
    puts "please enter a character name"
    # use gets to capture the user's input. This method should return that input, downcased.
    name = gets.chomp.downcase
    return name
  end
  