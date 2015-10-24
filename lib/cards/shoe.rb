require_relative 'card'

class Shoe < Cards
  attr_reader :num_of_decks

  def initialize(num_of_decks = 6)
    super()
    @num_of_decks = num_of_decks
    prepare!
  end

  def deal_one(silent: false)
    pop_card = @cards.pop
    if silent
      puts "......".rjust(30)
    else
      puts pop_card
    end
    pop_card
  end

  class Deck < Cards

    def initialize
      @cards = Card::RANK_NAME.keys
      .product(Card::SUIT_NAME.keys)
      .collect do |r, s|
        Card.new(r, s)
      end
    end
  end

  private

  def prepare!
    @num_of_decks.times do
      add_card *Deck.new
    end
    @cards.shuffle!
  end
end
