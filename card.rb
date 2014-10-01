
class Card
  attr_accessor :rank, :suit
  def initialize(s,r)
    @suit = s
    @rank = r
  end

  def face_value
    if is_ace?
      11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end

  def is_ace?
    rank == 'A'
  end

  def to_s
    suit_name = case suit
    when 'D' then "Diamonds"
    when 'C' then "Clubs"
    when 'H' then "Hearts"
    when 'S' then "Spades"
    else suit
    end

    rank_name = case rank
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

    "#{rank_name} of #{suit_name}" + "#{face_value}".rjust(3)
  end
end