class Card

  RANK_NAME = { '2' => "Two",
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

  SUIT_NAME = { 'D' => "Diamonds",
                'C' => "Clubs",
                'H' => "Hearts",
                'S' => "Spades"
              }

  attr_reader :rank, :suit
  attr_accessor :face_value

  def initialize(r, s)
    @rank, @suit = r, s
  end

  def to_s
    "#{RANK_NAME[rank]} of #{SUIT_NAME[suit]}".rjust(30) +
    "#{face_value}".rjust(3)
  end

  def face_value
    case rank
    when 'A'
      @face_value || 11
    when 'J', 'K', 'Q'
      10
    else
      rank.to_i
    end
  end
end

class Cards
  include Enumerable

  def initialize
    @cards = []
  end

  def add_card(*cards)
    @cards.push *cards
  end

  def find_card(index)
    @cards[index]
  end

  def first
    @cards.first
  end

  def last
    @cards.last
  end

  def each &block
    @cards.compact.each do |c|
      block.call c
    end
  end
end

