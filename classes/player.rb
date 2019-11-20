class Player
  attr_accessor :name, :hands, :bank
  attr_reader :score

  def initialize(name)
    @name = name
    @hands
    @bank = 100
  end

  def show_hands
    puts @hands.hand
  end

  def bet
    @bank -= 10 if @bank > 0
  end

  def gain(arg)
    @bank += arg
  end
end
