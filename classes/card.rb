# frozen_string_literal: true

# class for creating Cards
class Card
  attr_accessor :nominal, :suit

  def initialize(nominal, suit)
    @nominal = nominal
    @suit = suit
  end
end
