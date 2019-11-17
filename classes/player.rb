class Player
  attr_accessor :name, :hands, :bank
  attr_reader :score

  def initialize(name)
    @name = name
    @hands = {}
    @bank = 100
  end

  def show_hands
    puts @hands
  end

  def scoring
    @score = 0
    @hands.each_value do |value|
      value = 1 if value == 11 && @score > 21
      @score += value
    end
    @score
  end

  def bet
    @bank -= 10 if @bank > 0
  end
end
