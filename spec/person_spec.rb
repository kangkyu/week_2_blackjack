require 'spec_helper'

describe "Person" do

  context "hand holds cards" do
    before do
      @person = Person.new("person")
      @person << Card.new('D','2')
    end

    it "counts cards in it" do
      expect(@person.hand.card_count).to eq(1)
    end
  end

  it "gets a card by <<" do
    shoe1 = Shoe.new
    player = Player.new
    player << shoe1.deal_one
    expect(player.hand.cards.count).to eq(1)
  end
end
