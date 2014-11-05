require_relative 'deck'

class Shoe
  attr_accessor :cards
  def initialize(number_of_decks = 6)
    @cards = []
    number_of_decks.times {@cards.push *(Deck.new.cards)}
    @cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end

  def each_card
    @cards.each do |card|
      yield card
    end
  end
end