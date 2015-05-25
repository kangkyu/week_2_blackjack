require_relative 'person'

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def decide_hit
    sleep 1
    hand.total_value < 17
  end
end
