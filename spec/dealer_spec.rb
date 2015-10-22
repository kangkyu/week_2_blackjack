require 'spec_helper'

describe 'Dealer' do

  it "names 'Dealer' by default" do
    dealer = Dealer.new
    expect(dealer.name).to eq("Dealer")
  end

  it "decides hit by house rule" do
    dealer = Dealer.new
    dealer << Card.new("2", "D")
    expect(dealer.decide_hit).to be_truthy

    dealer << Card.new("A", "D")
    dealer << Card.new("7", "D")
    expect(dealer.decide_hit).to be_falsey
  end
end