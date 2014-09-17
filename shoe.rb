class Shoe
  NUM_DECKS = 6
  attr_accessor :cards
  def initialize(num_of_decks = NUM_DECKS)
    @cards = Array.new
    suit = ['D','C','H','S']
    rank = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    num_of_decks.times do
      suit.product(rank).each {|s,r| cards << Card.new(s,r)}
    end
  end

  def size
    cards.size
  end

  def deal_one
    cards.pop
  end

  def shuffle!
    cards.shuffle!
  end
end

class Card
  attr_accessor :rank, :suit
  def initialize(s,r)
    @suit = s
    @rank = r
  end

  def face_value
    if rank == 'A'
      11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end

  def full_name
    "#{to_word(rank)} of #{to_word(suit)}"
  end

  private
  def to_word(c)
    case c
    when 'D' then "Diamonds"
    when 'C' then "Clubs"
    when 'H' then "Hearts"
    when 'S' then "Spades"
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
    end
  end
end