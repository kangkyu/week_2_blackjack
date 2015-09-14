require_relative 'card'

class Hand
  include WithMultipleCards

  attr_accessor :cards
  def initialize
    @cards = []
  end

  def total_value
    soft_aces_count.times do
      cards[soft_first_at].face_value = 1 if face_value_sum > 21
    end
    face_value_sum
  end

  private
  
  def soft_aces_count
    cards.count {|card| card.face_value == 11}
  end

  def face_value_sum
    cards.map {|card| card.face_value}.reduce(0, :+)
  end

  def soft_first_at
    cards.find_index {|card| card.face_value == 11}
  end
end
