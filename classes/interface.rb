# frozen_string_literal: true

# class for create Interface
class Interface
  def name
    puts 'Hello. Enter your name'
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
    player.hands.hand.each do |card, value|
      puts "#{card.nominal}#{card.suit} - #{value}"
    end
  end

  def show_score(player)
    puts "#{player.name}: #{player.hands.scoring}"
  end

  def play_again
    puts 'Will you play again? (Y/N)'
    input = gets.chomp
    case input
    when 'y'
      MAIN.game_menu
    when 'n'
      puts 'Good bye. Try again'
    end
  end

  def open_cards(user, dealer, game)
    game.counting_results(user, dealer)
    puts "#{user.name} bank: #{user.bank}"
    show_score(user)
    show_hands(user)
    puts "#{dealer.name} bank: #{dealer.bank}"
    show_score(dealer)
    show_hands(dealer)
  end

  def show_result(result)
    puts result
  end
end
