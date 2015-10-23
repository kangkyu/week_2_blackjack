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
    hand.each {|card| puts card}
  end

  def <=>(other)
    hand.total_value <=> other.hand.total_value
  end

  def clear
    hand.clear!
  end

  def push(*arg)
    hand.add_card(*arg)
  end

  def <<(arg)
    hand.add_card arg
    puts " ...passes to #{name}"
    puts
  end

  def blackjack?
    hand.total_value == 21
  end

  def busted?
    hand.total_value > 21
  end
end
