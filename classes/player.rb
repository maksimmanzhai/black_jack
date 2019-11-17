class Player
  attr_accessor :name, :hands, :bank
  attr_reader :score

  def initialize(name)
    @name = name
    @hands = {}
    @bank = 100
    @score = 0
  end

  def show_hands
    puts @hands
  end

  def scoring
    @hands.each_value { |value| @score += value }
  end
end
