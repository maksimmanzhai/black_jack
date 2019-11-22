# frozen_string_literal: true

# class for creating Player
class Player
  attr_accessor :name, :hands, :bank
  attr_reader :score

  def initialize(name)
    @name = name
    @hands = {}
    @bank = 100
  end

  def bet
    @bank -= 10 if @bank.positive?
  end

  def gain(arg)
    @bank += arg
  end
end
