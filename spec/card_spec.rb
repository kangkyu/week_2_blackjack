require 'spec_helper'

describe "Card" do

  it "has a face value" do
    card = Card.new('D','2')
    expect(card.face_value).to eq(2)
  end

  it "has a string representation" do
    card = Card.new('D','2')
    expect("#{card}").to eq("Two of Diamonds".rjust(30) + 
      "#{card.face_value}".rjust(3))
  end

  it "has editable face value for Aces" do
    card = Card.new('D','A')
    card.face_value = 1
    expect(card.face_value).to eq(1)
  end
end
