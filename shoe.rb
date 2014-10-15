require_relative 'card'

class Shoe
  attr_accessor :cards
  def initialize(number_of_decks)
    table_deck = []
    number_of_decks.times {table_deck.push *(Deck.new.cards)}
    @cards = table_deck.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

class Deck
  SUITS = ['D','C','H','S']
  RANKS = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']

  attr_accessor :cards
  def initialize
    card_box = []
    SUITS.product(RANKS).each do |suit,rank|
      card_box << Card.new(suit,rank)
    end
    @cards = card_box.shuffle!
  end
end
