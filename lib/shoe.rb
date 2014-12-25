require_relative 'deck'

class Shoe
  include WithMultipleCards
  
  attr_accessor :cards
  def initialize(num_of_decks=6)
    @num_of_decks = num_of_decks
    @cards = []
    prepare
  end

  def deal_one
    cards.pop
  end

  private

  def prepare
    @num_of_decks.times do
      cards.push *(Deck.new.cards)
    end
    cards.shuffle!
  end
end

