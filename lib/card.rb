class Card
  SUIT_NAME = {'D' => "Diamonds", 'C' => "Clubs", 'H' => "Hearts", 'S' => "Spades" }
  RANK_NAME = {'2' => "Two", '3' => "Three", '4' => "Four", '5' => "Five", '6' => "Six", '7' => "Seven", '8' => "Eight", '9' => "Nine", '10' => "Ten", 'J' => "Jack", 'K' => "King", 'Q' => "Queen", 'A' => "Ace" }

  attr_reader :rank, :suit
  attr_accessor :face_value
  def initialize(s,r)
    @suit,@rank = s,r
    @face_value = 0
  end

  def to_s
    "#{Card::RANK_NAME[rank]} of #{Card::SUIT_NAME[suit]}".rjust(30) + "#{face_value}".rjust(3)
  end

  def set_face_value
    @face_value = if rank.include? 'A'
      11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end
end
