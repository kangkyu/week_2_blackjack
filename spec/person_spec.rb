require 'spec_helper'

describe "Person" do

  context "hand holds cards" do
    before do
      @person = Person.new("person")
      @person.receive Card.new('D','2')
    end

    it "counts cards in it" do
      expect(@person.count).to eq(1)
    end
  end

  it "gets a card by receive" do
    shoe1 = Shoe.new(1)
    player = Player.new

    expect(shoe1.count).to eq(52*1)
    expect(player.count).to eq(0)

    player.receive shoe1.deal_one

    expect(player.count).to eq(1)
  end
end
