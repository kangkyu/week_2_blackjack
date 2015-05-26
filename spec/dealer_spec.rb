require 'spec_helper'

describe 'Dealer' do

  it "names 'Dealer' by default" do
    dealer = Dealer.new
    expect(dealer.name).to eq("Dealer")
  end

  it "decides hit by house rule" do
    dealer = Dealer.new
    dealer << Card.new('D','2')
    expect(dealer.decide_hit).to be_truthy

    dealer << Card.new('D','A')
    dealer << Card.new('D','7')
    expect(dealer.decide_hit).to be_falsey
  end
end