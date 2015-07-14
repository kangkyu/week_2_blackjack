module WithMultipleCards

  def each_card
    @cards.each do |card|
      yield card
    end
  end

  def card_count
    @cards.size
  end
end

class Card
 
  SUIT_NAME = {
    'D' => "Diamonds", 
    'C' => "Clubs", 
    'H' => "Hearts", 
    'S' => "Spades" 
  }

  RANK_NAME = {
    '2' => "Two", 
    '3' => "Three", 
    '4' => "Four", 
    '5' => "Five", 
    '6' => "Six", 
    '7' => "Seven", 
    '8' => "Eight", 
    '9' => "Nine", 
    '10' => "Ten", 
    'J' => "Jack", 
    'K' => "King", 
    'Q' => "Queen", 
    'A' => "Ace" 
  }

  attr_reader :rank, :suit
  attr_accessor :face_value
  def initialize(s, r)
    @suit, @rank = s, r
  end

  def to_s
    "#{RANK_NAME[rank]} of #{SUIT_NAME[suit]}".rjust(30) + "#{face_value}".rjust(3)
  end

  def face_value
    if rank.include? 'A'
      @face_value || 11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end
end
