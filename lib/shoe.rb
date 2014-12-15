require_relative 'deck'

class Shoe
  include WithMultipleCards
  
  attr_accessor :cards
  def initialize(num_of_decks=6)
    cards = []
    num_of_decks.times do
      cards.push *(Deck.new.cards)
    end
    @cards = cards
  end

  def deal_one
    @cards.pop
  end

  def size
    @cards.size
  end
end

