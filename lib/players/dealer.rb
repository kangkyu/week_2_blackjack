require_relative 'person'

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def decide_hit
    sleep 1
    total_value < 17
  end

  def flip_first_card
    puts "#{name}'s first card was:"
    puts first
  end
end
