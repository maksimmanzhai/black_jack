class Game
  def initialize
  end

  def dealing(cards, player, dealer)
    player.hands = cards.to_a.sample(2).to_h
    dealer.hands = cards.to_a.sample(2).to_h
  end

end
