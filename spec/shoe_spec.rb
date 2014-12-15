require 'shoe'

describe "Shoe" do

  it "has cards of 52 multiplied by number of decks" do
    shoe1 = Shoe.new(7)
    expect(shoe1.card_count).to eq(52*7)
  end

  it "has 6 decks as default" do
    shoe1 = Shoe.new
    expect(shoe1.card_count).to eq(52*6)
  end

  it "has 4 different suits" do
    shoe1 = Shoe.new
    suits = []
    shoe1.each_card do |card| 
      suits.push card.suit 
    end
    suits.uniq!
    expect(suits.sort).to eq(Deck::SUITS.sort)
  end

  it "has 13 different ranks" do
    shoe1 = Shoe.new
    ranks = []
    shoe1.each_card do |card| 
      ranks.push card.rank 
    end
    ranks.uniq!
    expect(ranks.sort).to eq(Deck::RANKS.sort)
  end

  it "has 52 different card names" do
    shoe1 = Shoe.new
    names = []
    shoe1.each_card do |card| 
      names.push card.to_s 
    end
    expect(names.uniq.size).to eq(52)
  end

  it "has deal_one method to deal one card at a time" do
    shoe1 = Shoe.new
    hand = []
    hand.push shoe1.deal_one
    expect(hand.count).to eq(1)
  end

  it "has size method to count all cards in it" do
    shoe1 = Shoe.new
    expect(shoe1.card_count).to eq(shoe1.cards.count)
  end
end
