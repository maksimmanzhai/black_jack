class Game
  def initialize
  end

  def add_card(cards, player)
    player.hands.merge!(cards.card_deck.to_a.sample(1).to_h)
    player.hands.each_key { |key| (cards.card_deck).delete(key) }
  end

end
