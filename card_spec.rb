require_relative 'card'

describe "Card" do

  it "has a string representation" do
    card = Card.new('D', '2')
    card.to_s.should == 
    "#{card.rank_name} of #{card.suit_name}".rjust(30) + "#{card.face_value}".rjust(3)
  end

end