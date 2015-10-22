require 'spec_helper'

describe "Shoe" do

  it "has 52 by number of decks cards" do
    shoe1 = Shoe.new(7)
    expect(shoe1.card_count).to eq(52*7)
  end

  it "has 6 decks as default" do
    shoe1 = Shoe.new
    expect(shoe1.card_count).to eq(52*6)
  end

  it "has deal_one method to deal one card at a time" do
    shoe1 = Shoe.new
    hand = Hand.new
    hand.cards.push shoe1.deal_one
    expect(hand.card_count).to eq(1)
  end
end
