class Dealer
  attr_accessor :hands, :bank

  def initialize
    @hands = {}
    @bank = 100
  end
end
