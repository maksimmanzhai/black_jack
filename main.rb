require './classes/player.rb'
require './classes/cards.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/user.rb'


class Main
  def initialize
  end

  def menu
    puts "Hello. Enter your name"
    user_name = gets.chomp.capitalize
    user = create_user(user_name)
    dealer = create_dealer
    start_game(user, dealer)
    user.scoring
    dealer.scoring
    user.bet
    dealer.bet
    puts "#{user.name}: #{user.score}"
    puts "#{user.show_hands}"
    choice = user_play
    case choice
    when 1
      dealer_play(dealer)
    when 2
      add_card(user)
    when 3
      open_cards(user, dealer)
    else
      puts 'Good bye. Try again'
    end
    dealer_play(dealer)
    open_cards(user, dealer)
  end

  def create_user(name)
    user = User.new(name)
  end

  def create_dealer
    dealer = Dealer.new
  end

  def start_game(user, dealer)
    @cards = Cards.new
    @game = Game.new
    2.times { @game.add_card(@cards, user) }
    2.times { @game.add_card(@cards, dealer) }
  end

  def user_play
    puts 'What is your choice?'
    puts '1 - Skip'
    puts '2 - Add card'
    puts '3 - Open cards'
    choice = gets.chomp.to_i
  end

  def dealer_play(dealer)
    @game.add_card(@cards, dealer) if dealer.scoring < 17 && dealer.hands.size <= 3
  end

  def add_card(player)
    @game.add_card(@cards, player) if player.hands.size <= 3
  end
  
  def open_cards(user, dealer)
    counting_results(user, dealer)
    puts "#{user.name} bank: #{user.bank}"
    puts "#{user.name}: #{user.score}"
    puts "#{user.show_hands}"
    puts "#{dealer.name} bank: #{dealer.bank}"
    puts "#{dealer.name}: #{dealer.score}"
    puts "#{dealer.show_hands}"
  end

  def counting_results(user, dealer)
    user.scoring
    dealer.scoring
    if user.score == dealer.score
      result = 'Draw'
      user.gain(10)
      dealer.gain(10)
    end
    if (user.score > dealer.score && user.score < 21) || user.score == 21
      result = "#{user.name} win"
      user.gain(20)
    end
    if user.score < dealer.score || user.score > 21
      result = "#{dealer.name} win"
      dealer.gain(20)
    end
    puts result
  end
end

@game = Main.new
@game.menu
