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

class Deck
  include WithMultipleCards
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

  attr_reader :cards
  def initialize
    @cards = []
    prepare
  end

  private

  def prepare
    # Deck::DECK_SUITS.product(Deck::DECK_RANKS).each do |suit,rank|
    #   cards << Card.new(suit,rank)
    # end
    @cards = Deck::SUIT_NAME.keys.product(Deck::RANK_NAME.keys).collect do |e|
      Card.new(e[0],e[1])
    end
    cards.shuffle!
  end
end
