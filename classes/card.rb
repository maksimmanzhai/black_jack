class Card
  attr_accessor :card_deck

  NOMINALS_1 = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']

  SPADES = "\u2660"
  HEARTS = "\u2665"
  DIAMONDS = "\u2666"
  CLUBS = "\u2663"

  SUITS = [SPADES, HEARTS, DIAMONDS, CLUBS]

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
