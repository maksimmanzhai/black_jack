# frozen_string_literal: true

# class for creating Deck
class Deck
  attr_accessor :deck_of_cards

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
