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

  def decide_hit
    puts "decide_hit should be defined to return true or false"
  end

  def status
    puts "=== Person.status ==="
    sleep 1
    puts "=== status of #{name} ==="
    puts "#{name} has now total value : #{total_value}"
    each {|card| puts card}
  end

  def receive(card)
    puts "=== Person.receive ==="
    sleep 1
    add_card card
    puts " ...passes to #{name}".rjust(30)
    puts
  end
  alias_method "<<", "receive"
end
