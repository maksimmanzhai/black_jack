require './classes/cards.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/player.rb'

class Main
  def initialize
  end

  def menu
    loop do
      puts "Hello. Enter your name"
      user_name = gets.chomp
      player = create_user(user_name)
      dealer = create_dealer
      start_game(player, dealer)
    end
  end

  def create_user(name)
    user = Player.new(name)
  end

  def create_dealer
    dealer = Dealer.new
  end

  def start_game(player, dealer)
    cards = Cards.new
    game = Game.new
    game.dealing(cards.card_deck, player, dealer)
  end
end

game = Main.new
game.menu
