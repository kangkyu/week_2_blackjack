require 'deck'

describe 'deck' do
  
  it "has 4 suits" do
    expect(Deck::SUITS).to eq(['D','C','H','S'])
  end

  it "has 13 ranks" do
    expect(Deck::RANKS).to eq(['2','3','4','5','6','7','8','9','10','J','K','Q','A'])
  end

  it "has 52 cards" do
    deck = Deck.new
    expect(deck.cards.count).to eq(52)
  end

end