require_relative 'card'

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

  DECK_SUITS = ['D','C','H','S']
  DECK_RANKS = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']

  attr_reader :cards
  def initialize
    @cards = []
    prepare
  end

  private

  def prepare
    Deck::DECK_SUITS.product(Deck::DECK_RANKS).each do |suit,rank|
      cards << Card.new(suit,rank)
    end
    cards.shuffle!
  end
end
