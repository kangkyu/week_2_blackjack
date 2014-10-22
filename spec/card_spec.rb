require 'card'

describe "Card" do

  it "has a string representation" do
    card = Card.new('D','2')
    card.set_face_value
    card.to_s.should == 
    "#{card.rank_name} of #{card.suit_name}".rjust(30) + "#{card.face_value}".rjust(3)
  end

end