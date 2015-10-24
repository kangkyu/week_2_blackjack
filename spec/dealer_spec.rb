require 'spec_helper'

describe 'Dealer' do

  it "names 'Dealer' by default" do
    dealer = Dealer.new
    expect(dealer.name).to eq("Dealer")
  end

  it "decides hit by house rule" do
    dealer = Dealer.new
    dealer.receive Card.new("2", "D")
    expect(dealer.hit?).to eq(true)

    dealer.receive Card.new("A", "D")
    dealer.receive Card.new("7", "D")
    expect(dealer.hit?).to eq(false)
  end
end