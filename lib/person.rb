require_relative 'hand'

class Person
  include Comparable

  attr_accessor :hand, :name
  def initialize(name)
    @name = name.capitalize
    @hand = Hand.new
  end

  def hit?
    decide_hit
  end

  def status
    puts "=== Person.status ==="
    puts "=== status of #{name} ==="
    puts "#{name} has now total value : #{hand.total_value}"
    hand.each_card {|card| puts card}
  end

  def <=>(other)
    hand.total_value <=> other.hand.total_value
  end

  def clear
    hand.cards.clear
  end

  def push(*arg)
    hand.cards.push(*arg)
  end

  def <<(arg)
    hand.cards << arg
    puts " ... passes to #{name}"
  end

  def blackjack?
    hand.total_value == 21
  end

  def busted?
    hand.total_value > 21
  end

  def flip_first_card
    puts "#{name}'s first card was:"
    puts hand.cards[0]
  end
end
