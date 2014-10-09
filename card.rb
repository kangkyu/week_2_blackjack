class Card
  attr_reader :rank, :suit 
  attr_accessor :face_value
  def initialize(s,r)
    @suit = s
    @rank = r
    @face_value = 0
  end

  def set_face_value
    if rank == 'A'
      self.face_value = 11
    elsif rank.to_i == 0
      self.face_value = 10
    else
      self.face_value = rank.to_i
    end
  end

  def to_s
    "#{rank_name} of #{suit_name}".rjust(30) + "#{face_value}".rjust(3)
  end

  def suit_name 
    case suit
    when 'D' then "Diamonds"
    when 'C' then "Clubs"
    when 'H' then "Hearts"
    when 'S' then "Spades"
    else suit
    end
  end

  def rank_name 
    case rank
    when '2' then "Two"
    when '3' then "Three"
    when '4' then "Four"
    when '5' then "Five"
    when '6' then "Six"
    when '7' then "Seven"
    when '8' then "Eight"
    when '9' then "Nine"
    when '10' then "Ten"
    when 'J' then "Jack"
    when 'K' then "King"
    when 'Q' then "Queen"
    when 'A' then "Ace"
    else rank
    end
  end
end