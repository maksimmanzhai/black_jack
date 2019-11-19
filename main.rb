require './classes/interface.rb'
require './classes/player.rb'
require './classes/cards.rb'
require './classes/dealer.rb'
require './classes/game.rb'
require './classes/user.rb'

# 2. Заведи отдельный класс Hand - он будет хранить карты игрока, считать 
# сумму очков

# 3. Класс Cards лучше переработать в Card - он будет представлять карту, 
# отвечать навопрос "сколько очков стоит карта"

# Масти все-таки лучше сделать юникодом.
# Убери всю логику из initialize
# nominals и suits лучше сделать константой в классе Card

class Main
  def initialize
  end

  def game_menu
    @interface = Interface.new
    user_name = @interface.name
    @user = create_user(user_name)
    @dealer = create_dealer
    @user.hands = {}
    @dealer.hands = {}
    start_game
    @user.scoring
    @dealer.scoring
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
      @interface.open_cards(@user, @dealer)
    else
      puts 'Good bye. Try again'
    end
    dealer_play(@dealer)
    @interface.open_cards(@user, @dealer)
    @interface.play_again
  end

  def create_user(name)
    User.new(name)
  end

  def create_dealer
    Dealer.new
  end

  def start_game
    @cards = Cards.new
    @game = Game.new
    2.times { @game.add_card(@cards, @user) }
    2.times { @game.add_card(@cards, @dealer) }
  end

  def dealer_play(dealer)
    @game.add_card(@cards, @dealer) if @dealer.scoring < 17 && @dealer.hands.size <= 3
  end

  def add_card(player)
    @game.add_card(@cards, player) if player.hands.size <= 3
  end

  def counting_results
    @user.scoring
    @dealer.scoring
    if @user.score == @dealer.score
      result = 'Draw'
      @user.gain(10)
      @dealer.gain(10)
    end
    if (@user.score > @dealer.score && @user.score < 21) || @user.score == 21
      result = "#{@user.name} win"
      @user.gain(20)
    end
    if @user.score < @dealer.score || @user.score > 21
      result = "#{@dealer.name} win"
      @dealer.gain(20)
    end
    @interface.show_result(result)
  end
end

$main = Main.new
$main.game_menu
