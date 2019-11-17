class Cards
  attr_accessor :card_deck

  def initialize
    nominals_1 = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
    suits = ['+', '<3', '^', '<>']
    nominals_2 = []
    suits.each do |suit|
      nominals_1.each do |nominal|
        nominals_2 << (nominal + suit)
      end
    end
    points = [11, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    @card_deck = Hash[nominals_2.zip(points * 4)]
  end
end
