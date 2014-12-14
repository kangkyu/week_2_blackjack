require_relative 'card'

class Deck
  SUITS = ['D','C','H','S']
  RANKS = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']

  attr_accessor :cards
  def initialize
    @cards = []
    SUITS.product(RANKS).each do |suit,rank|
      @cards << Card.new(suit,rank)
    end
    @cards.shuffle!
  end

  def each_card
    @cards.each do |card|
      yield card
    end
  end
end
