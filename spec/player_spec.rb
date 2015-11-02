require 'spec_helper'

describe 'Player' do
  before do
    @player = Player.new('larry')
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "updates its name" do
    @player.name = "jimmy"
    expect(@player.name).to eq("Jimmy")
  end

  it "has default current money and spends it" do
    expect(@player.money_current).to eq(Player::START_AMOUNT)

    @player.money_current = 10
    expect(@player.money_current).to eq(10)
  end

  it "has current money by object definition" do
    skip 'need option hash'
    player2 = Player.new('samson', money: 1357)
    expect(@player.money_current).to eq(1357)
  end

  it "wins bet money" do
    @player.money_bet = 10
    expect do
      @player.wins
    end.to change { @player.money_current }.by 10
  end

  it "loses bet money" do
    @player.money_bet = 10
    expect do
      @player.loses
    end.to change { @player.money_current }.by -10
  end
end
