require_relative 'shoe'

describe "Shoe" do
  it "has number of cards of 52 multiplied by number of decks" do
    shoe1 = Shoe.new
    shoe1.number_of_decks = 7
    shoe1.prepare
    shoe1.size.should == 364
    # shoe1.size.should == shoe1.number_of_decks * 52
    # (shoe1.number_of_decks * 52).should == 364
  end
end