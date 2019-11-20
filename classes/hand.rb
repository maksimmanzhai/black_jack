class Hand
  attr_accessor :hand, :score

  def initialize
    @hand = {}
    @score = 0
  end

  def scoring
    @score = 0
    @hand.each_value do |value|
      value = 1 if (value == 11 && @score > 21) && @hand.size == 3
      @score += value
    end
    @score
  end
end
