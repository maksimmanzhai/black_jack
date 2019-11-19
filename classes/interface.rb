class Interface
  def initialize
  end

  def name
    puts "Hello. Enter your name"
    user_name = gets.chomp.capitalize
  end

  def user_play
    puts 'What is your choice?'
    puts '1 - Skip'
    puts '2 - Add card'
    puts '3 - Open cards'
    choice = gets.chomp.to_i
  end

  def play_again
    puts "Will you play again? (Y/N)"
    input = gets.chomp
    case input
    when 'y'
      game_menu
    when 'n'
      puts 'Good bye. Try again'
    end
  end

end