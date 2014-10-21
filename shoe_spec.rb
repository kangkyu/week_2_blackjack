require_relative 'shoe'

describe "Shoe" do
  it "has number of cards of 52 multiplied by number of decks" do
    shoe1 = Shoe.new(7)
    shoe1.size.should == 364
  end

  it "deals one card at a time" do
    cards = []
    shoe1 = Shoe.new
    cards.push shoe1.deal_one
    cards.size.should == 1
  end
end