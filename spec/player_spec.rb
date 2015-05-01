require 'player'

describe 'Player' do

  it "has a capitalized name" do
    player1 = Player.new('larry')
    expect(player1.name).to eq("Larry")
  end
end
