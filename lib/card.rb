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

module WithMultipleCards

  def each_card &block
    @cards.sort_by {|card| card.rank}.each do |card|
      block.call card
    end
  end

  def card_count
    @cards.size
  end
end
