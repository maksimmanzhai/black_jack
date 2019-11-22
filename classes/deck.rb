# frozen_string_literal: true

# class for creating Deck
class Deck
  attr_accessor :deck_of_cards

  NOMINALS = %w[A K Q J 10 9 8 7 6 5 4 3 2].freeze

  SUITS = ["\u2660", "\u2665", "\u2666", "\u2663"].freeze

  POINTS = [11, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2].freeze

  def initialize
    @deck_of_cards = {}
  end

  def deck_creation
    SUITS.each do |suit|
      NOMINALS.zip(POINTS).each do |nominal|
        @deck_of_cards[Card.new(nominal[0], suit)] = nominal[1]
      end
    end
  end

  def add_card(number, hand)
    number.times do
      hand.merge!(@deck_of_cards.to_a.sample(1).to_h)
      hand.each_key { |key| @deck_of_cards.delete(key) }
    end
  end
end
