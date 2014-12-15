require_relative 'deck'

class Shoe
  attr_accessor :cards
  def initialize
    @cards = []
    6.times do
      @cards.push *(Deck.new.cards)
    end
  end

  def deal_one
    @cards.pop
  end

  def size
    @cards.size
  end

  def each_card
    @cards.each do |card|
      yield card
    end
  end
end
