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
    suits = ['D','C','H','S']
    ranks = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    ask_number_of_decks.times do
      suits.product(ranks).each do |suit,rank| 
        cards << Card.new(suit,rank)
      end
    end
    cards.each {|card| card.set_face_value }
    cards.shuffle!
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
