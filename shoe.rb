require_relative 'card'

class Shoe
  
  attr_accessor :cards, :number_of_decks
  def initialize(num = 6)
    @cards = Array.new
    @number_of_decks = num
  end

  def size
    cards.size
  end

  def prepare
    number_of_decks.times {cards.push *deck_of_cards}
    cards.shuffle!
  end

private

  def deck_of_cards
    card_box = []
    four_suits = ['D','C','H','S']
    fourteen_ranks = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    four_suits.each do |suit|
      fourteen_ranks.each do |rank|
        each_card = Card.new(suit,rank)
        each_card.set_face_value
        card_box << each_card
      end
    end
    card_box.shuffle!
  end

end
