# frozen_string_literal: true

# class for creating Cards
class Card
  attr_accessor :nominal, :suit

  NOMINALS = %w[A K Q J 10 9 8 7 6 5 4 3 2].freeze

  SUITS = ["\u2660", "\u2665", "\u2666", "\u2663"].freeze

  POINTS = [11, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2].freeze

  def initialize(nominal, suit)
    @nominal = nominal
    @suit = suit
  end
end
