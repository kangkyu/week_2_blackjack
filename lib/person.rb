require_relative 'shoe'

module Hand
  def total_value
    soft_aces_count.times do
      cards[soft_first_at].face_value = 1 if face_value_sum > 21 
    end
    face_value_sum
  end

  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each {|card| puts card}
  end

  def <=>(other)
    total_value <=> other.total_value
  end

  def clear
    cards.clear
  end

  def push(*arg)
    cards.push(*arg)
  end
  
  def <<(arg)
    cards << arg
  end
  
  private
  
  def soft_aces_count
    cards.count{|card| card.face_value == 11}
  end

  def face_value_sum
    cards.map{|card| card.face_value}.reduce(0, :+)
  end

  def soft_first_at
    cards.find_index{|card| card.face_value == 11}
  end
end

class Person
  include Comparable
  include Hand

  attr_accessor :cards, :name
  def initialize(name)
    @cards = Array.new
    @name = name.capitalize
  end
end

