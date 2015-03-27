require_relative 'card'

class Shoe
  include WithMultipleCards
  
  attr_accessor :cards
  def initialize(num_of_decks=6)
    @num_of_decks = num_of_decks
    @cards = []
    prepare
  end

  def deal_one
    pop_card = cards.pop
    puts pop_card
    pop_card
  end

  def silent_deal_one
    pop_card = cards.pop
    puts ("*" * pop_card.to_s.length)
    pop_card
  end
  private

  def prepare
    @num_of_decks.times do
      cards.push *(Deck.new.cards)
    end
    cards.shuffle!
  end
end

