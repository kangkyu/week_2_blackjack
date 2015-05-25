require 'spec_helper'

describe 'Player' do

  it "has a capitalized name" do
    player = Player.new('larry')
    expect(player.name).to eq("Larry")
  end
end
