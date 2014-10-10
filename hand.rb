require_relative 'card'

module Hand

  def total_value
    total = face_value_sum
    soft_aces_count.times do
      if total > 21 
        soft_first_at = cards.find_index{|card| card.face_value == 11}
        cards[soft_first_at].face_value = 1
        total = face_value_sum
      else
        break
      end
    end
    total
  end
  
  def soft_aces_count
    cards.count{|card| card.face_value == 11}
  end

  def face_value_sum
    cards.map{|card| card.face_value}.reduce(0, :+)
  end
end