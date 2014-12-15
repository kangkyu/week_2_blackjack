require 'person'

describe "Person" do

  it "has a capitalized name" do
    player1 = Player.new('larry')
    expect(player1.name).to eq("Larry")
  end

  context "hand holds cards" do
    before do
      @person = Person.new("person")
      @person << Card.new('D','2')
    end

    it "counts cards in it" do
      expect(@person.hand.card_count).to eq(1)
    end
  end
end
