require_relative 'card'

class Shoe
  DEFAULT_NUM_OF_DECKS = 6
  
  attr_accessor :cards
  def initialize
    @cards = Array.new
  end

  def size
    cards.size
  end

  def prepare
    ask_number_of_decks.times {cards.push *deck_of_cards}
    cards.shuffle!
  end

private
  def deck_of_cards
    card_box = []
    four_suits = ['D','C','H','S']
    fourteen_ranks = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    four_suits.product(fourteen_ranks).each do |suit,rank|
      each_card = Card.new(suit,rank)
      each_card.set_face_value
      card_box << each_card
    end
    card_box.shuffle!
  end

  def ask_number_of_decks
    puts "how many decks in this game's shoe? (default #{DEFAULT_NUM_OF_DECKS})"
    answer = gets.chomp
    if answer.empty?
      DEFAULT_NUM_OF_DECKS
    else
      if answer.to_i == 0
        puts "please type a 1,2,3 number, please!"
        ask_number_of_decks
      else
        answer.to_i
      end
    end
  end
end
