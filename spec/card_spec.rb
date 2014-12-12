require 'card'

describe "Card" do

  it "has a string representation" do
    card = Card.new('D','2')
    card.set_face_value
    expect(card.to_s).to eq("Two of Diamonds".rjust(30) + "#{2}".rjust(3))
  end

  it "has an integer as its face value" do
    card = Card.new('D','2')
    card.set_face_value
    expect(card.face_value).to eq(2)
  end

end