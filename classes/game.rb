class Game
  def initialize
  end

  def dealing(cards, user, dealer)
    user.hands = cards.card_deck.to_a.sample(2).to_h
    user.hands.each_key { |key| (cards.card_deck).delete(key) }
    dealer.hands = cards.card_deck.to_a.sample(2).to_h
    dealer.hands.each_key { |key| (cards.card_deck).delete(key) }
  end
end
