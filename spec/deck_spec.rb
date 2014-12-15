require 'deck'

describe 'Deck' do
  before do
    @deck = Deck.new
  end
  
  it "has 52 cards in it" do
    expect(@deck.cards.count).to eq(52)
  end

  it "has 4 different suits" do
    suits = []
    @deck.each_card do |card| 
      suits.push card.suit 
    end
    suits.uniq!
    expect(suits.sort).to eq(Deck::SUITS.sort)
  end

  it "has 13 different ranks" do
    ranks = []
    @deck.each_card do |card| 
      ranks.push card.rank 
    end
    ranks.uniq!
    expect(ranks.sort).to eq(Deck::RANKS.sort)
  end
end
