module WithMultipleCards

  def each_card
    @cards.each do |card|
      yield card
    end
  end

  def card_count
    @cards.size
  end

end

class Deck
  include WithMultipleCards

  attr_reader :cards
  def initialize
    @cards = []
    prepare
  end

  private

  def prepare
    @cards = Card::SUIT_NAME.keys.product(Card::RANK_NAME.keys).collect do |e|
      Card.new(e[0],e[1])
    end
    cards.shuffle!
  end
end
