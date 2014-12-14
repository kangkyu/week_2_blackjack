require 'card'

describe "Card" do

  it "has a string representation" do
    card = Card.new('D','2')
    expect("#{card}").to eq("Two of Diamonds".rjust(30))
  end

end