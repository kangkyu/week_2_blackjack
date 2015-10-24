require_relative '../cards/hand'

class Person < Hand
  attr_accessor :name
  def initialize(name)
    @name = name.capitalize
    super()
  end

  def hit?
    decide_hit
  end

  def status
    puts "=== Person.status ==="
    puts "=== status of #{name} ==="
    puts "#{name} has now total value : #{total_value}"
    each {|card| puts card}
  end

  def receive(card)
    add_card card
    puts " ...passes to #{name}"
    puts
  end
end
