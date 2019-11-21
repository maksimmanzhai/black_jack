
# Масти все-таки лучше сделать юникодом.

class Card
  attr_accessor :card_deck

  NOMINALS_1 = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
  SUITS = ["\u2660", "\u2665", "\u2666", "\u2663"]
  POINTS = [11, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def initialize
    @card_deck
  end

  def deck_creation
    nominals_2 = []
    SUITS.each do |suit|
      NOMINALS_1.each do |nominal|
        nominals_2 << (nominal + suit)
      end
    end
    @card_deck = Hash[nominals_2.zip(POINTS * 4)]
  end
end
