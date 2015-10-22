require_relative 'card'

class Shoe
  include WithMultipleCards

  attr_accessor :cards
  def initialize(num_of_decks = 6)
    @num_of_decks = num_of_decks
    @cards = []
    prepare
  end

  def deal_one
    pop_card = cards.pop
    sleep 1
    puts pop_card
    pop_card
  end

  def silent_deal_one
    pop_card = cards.pop
    puts "\"hidden\"".rjust(30)
    pop_card
  end

  private

  def deck_of_cards
    Card::RANK_NAME.keys.product(Card::SUIT_NAME.keys).collect do |r, s|
      Card.new(r, s)
    end
  end

  def prepare
    @num_of_decks.times do
      cards.push *deck_of_cards
    end
    cards.shuffle!
  end
end
