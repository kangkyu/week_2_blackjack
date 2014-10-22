require_relative 'person'

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def hit?
    sleep 1
    total_value < 17
  end

  def flip_first_card
    puts "#{name}'s first card was:" 
    puts cards[0]
  end

  def show_second_card
    puts "#{name}'s second card showing:"
    puts cards[1]
  end
end