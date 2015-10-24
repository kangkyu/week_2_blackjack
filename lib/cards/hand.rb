require_relative 'card'

class Hand < Cards
  include Comparable

  def total_value
    soft_aces_count.times do
      find_card(soft_first_at).face_value = 1 if face_value_sum > 21
    end
    face_value_sum
  end

  def <=>(other)
    total_value <=> other.total_value
  end

  def blackjack?
    total_value == 21
  end

  def busted?
    total_value > 21
  end

  private
  
  def soft_aces_count
    count {|card| card.face_value == 11}
  end

  def face_value_sum
    map {|card| card.face_value}.reduce(0, :+)
  end

  def soft_first_at
    find_index {|card| card.face_value == 11}
  end
end
