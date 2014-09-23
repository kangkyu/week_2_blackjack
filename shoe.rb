class Shoe
  NUM_DECKS = 6
  attr_accessor :cards, :num_of_decks
  def initialize(num_of_decks = NUM_DECKS)
    @cards = Array.new
    @num_of_decks = 1
  end

  def size
    cards.size
  end

  def deal_one
    cards.pop
  end

  def shuffle!
    ask_number_of_decks
    suits = ['D','C','H','S']
    ranks = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    num_of_decks.times do
      suits.product(ranks).each do |suit,rank| 
        cards << Card.new(suit,rank)
      end
    end

    cards.shuffle!
  end

  def ask_number_of_decks
    puts "how many decks in this game's shoe?"
    answer = gets.chomp
    unless answer.empty?
      if answer.to_i == 0
        puts "please type a number"
        ask_number_of_decks
      else
        self.num_of_decks = answer.to_i
      end
    end
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

  def to_s
    suit_name = case suit
    when 'D' then "Diamonds"
    when 'C' then "Clubs"
    when 'H' then "Hearts"
    when 'S' then "Spades"
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
    end

    "#{rank_name} of #{suit_name}"
  end
end