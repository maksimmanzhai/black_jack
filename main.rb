# frozen_string_literal: true

require './classes/interface.rb'
require './classes/player.rb'
require './classes/card.rb'
require './classes/deck.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/user.rb'
require './classes/hand.rb'

# class for creating Main
class Main
  def add_interface
    @interface = Interface.new
  end

  def add_user
    user_name = @interface.name
    @user = create_user(user_name)
  end

  def game_menu
    @dealer = create_dealer
    @user.hands = Hand.new
    @dealer.hands = Hand.new
    start_game
    @user.hands.scoring
    @dealer.hands.scoring
    @user.bet
    @dealer.bet
    @interface.show_hands(@user)
    @interface.show_score(@user)
    choice = @interface.user_play
    case choice
    when 1
      dealer_play(@dealer)
    when 2
      add_card(@user)
    when 3
      @interface.open_cards(@user, @dealer, @game, @interface)
    else
      puts 'Good bye. Try again'
    end
    dealer_play(@dealer)
    @interface.open_cards(@user, @dealer, @game, @interface)
    @interface.play_again(self)
  end

  def create_user(name)
    User.new(name)
  end

  def create_dealer
    Dealer.new
  end

  def start_game
    @deck = Deck.new
    @deck.deck_creation
    @game = Game.new
    @deck.add_card(2, @user.hands.hand)
    @deck.add_card(2, @dealer.hands.hand)
  end

  def dealer_play(dealer)
    if @dealer.hands.scoring < 17 && @dealer.hands.hand.size < 3
      @deck.add_card(1, dealer.hands.hand)
    end
  end

  def add_card(player)
    @deck.add_card(1, player.hands.hand) if player.hands.hand.size < 3
  end
end

main = Main.new
main.add_interface
main.add_user
main.game_menu
