class Player
  attr_accessor :name, :hands, :bank

  def initialize(name)
    @name = name
    @hands = {}
    @bank = 100
  end
end
