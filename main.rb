require './classes/cards.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/player.rb'

class Main
  def menu
    loop do
      puts "Hello. Enter your name"
      user_name = gets.chomp
      create_user(user_name)
      start_game
    end
  end

  def create_user(name)
    user = Player.new(name)
  end

  def start_game
    card = Cards.new
    game = Game.new
    game.dealing
  end
end

game = Main.new
game.menu
