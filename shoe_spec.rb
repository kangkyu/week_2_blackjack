require_relative 'shoe'

describe "Shoe" do
  it "has number of cards of 52 multiplied by number of decks" do
    shoe1 = Shoe.new(7)
    shoe1.prepare
    shoe1.size.should == shoe1.number_of_decks * 52
  end
end