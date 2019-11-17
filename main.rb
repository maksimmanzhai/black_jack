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
    loop do
      case choice
      when 1
        dealer_play(dealer)
      when 2
        add_card(user)
      when 3
        open_cards
        
      else
        puts 'Good bye. Try again'
      end
    end
    user.scoring
    dealer.scoring
    puts "#{user.name}: #{user.score}"
    puts "#{user.show_hands}"
    puts "#{dealer.name}: #{dealer.score}"
    puts "#{dealer.show_hands}"
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
    if dealer.scoring >= 17
      user_play
    else
      @game.add_card(@cards, dealer) unless dealer.hands.size <= 3
    end
  end

  def add_card(player)
    @game.add_card(@cards, player) unless player.hands.size <= 3
  end
  
  def open_cards
    user.scoring
    dealer.scoring
    puts "#{user.name}: #{user.score}"
    puts "#{user.show_hands}"
    puts "#{dealer.name}: #{dealer.score}"
    puts "#{dealer.show_hands}"
  end
end

@game = Main.new
@game.menu
