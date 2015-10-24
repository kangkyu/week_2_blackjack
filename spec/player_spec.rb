require 'spec_helper'

describe 'Player' do

  it "has a capitalized name" do
    player = Player.new('larry')
    expect(player.name).to eq("Larry")
  end

  it "updates its name" do
    player = Player.new('Mark')
    player.name = "Jimmy"
    expect(player.name).to eq("Jimmy")
  end
end
