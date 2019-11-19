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

  def show_hands(player)
    puts "#{player.show_hands}"
  end

  def show_score(player)
    puts "#{player.name}: #{player.score}"
  end

  def play_again
    puts "Will you play again? (Y/N)"
    input = gets.chomp
    case input
    when 'y'
      $main.game_menu
    when 'n'
      puts 'Good bye. Try again'
    end
  end

  def open_cards(user, dealer)
    $main.counting_results
    puts "#{user.name} bank: #{user.bank}"
    puts "#{user.name}: #{user.score}"
    puts "#{user.show_hands}"
    puts "#{dealer.name} bank: #{dealer.bank}"
    puts "#{dealer.name}: #{dealer.score}"
    puts "#{dealer.show_hands}"
  end

  def show_result(result)
    puts result
  end

end