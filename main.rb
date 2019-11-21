require './classes/interface.rb'
require './classes/player.rb'
require './classes/card.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/user.rb'
require './classes/hand.rb'

class Main
  def initialize
  end

  def game_menu
    $interface = Interface.new
    user_name = $interface.name
    @user = create_user(user_name)
    @dealer = create_dealer
    @user.hands = Hand.new
    @dealer.hands = Hand.new
    start_game
    @user.hands.scoring
    @dealer.hands.scoring
    @user.bet
    @dealer.bet
    $interface.show_hands(@user)
    $interface.show_score(@user)
    choice = $interface.user_play
    case choice
    when 1
      dealer_play(@dealer)
    when 2
      add_card(@user)
    when 3
      $interface.open_cards(@user, @dealer, @game)
    else
      puts 'Good bye. Try again'
    end
    dealer_play(@dealer)
    $interface.open_cards(@user, @dealer, @game)
    $interface.play_again
  end

  def create_user(name)
    User.new(name)
  end

  def create_dealer
    Dealer.new
  end

  def start_game
    @cards = Card.new
    @cards.deck_creation
    @game = Game.new
    2.times { @game.add_card(@cards, @user.hands) }
    2.times { @game.add_card(@cards, @dealer.hands) }
  end

  def dealer_play(dealer)
    @game.add_card(@cards, dealer.hands) if @dealer.hands.scoring < 17 && @dealer.hands.hand.size < 3
  end

  def add_card(player)
    @game.add_card(@cards, player.hands) if player.hands.hand.size < 3
  end
end

$main = Main.new
$main.game_menu
