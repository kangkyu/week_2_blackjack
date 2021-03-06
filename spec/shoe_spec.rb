require 'spec_helper'

describe "Shoe" do

  it "has 52 by number of decks cards" do
    shoe1 = Shoe.new(7)
    expect(shoe1.count).to eq(52*7)
  end

  it "has 6 decks as default" do
    shoe1 = Shoe.new
    expect(shoe1.count).to eq(52*6)
  end

  it "has pass_one method to pop one card at a time" do
    shoe1 = Shoe.new
    hand = Hand.new
    hand.add_card shoe1.pass_one
    expect(hand.count).to eq(1)
  end

  it "has number of decks instance variable" do
    shoe1 = Shoe.new(1)
    expect(shoe1.num_of_decks).to eq(1)
  end
end
