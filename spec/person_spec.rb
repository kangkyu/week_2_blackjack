require 'shoe_game'

describe "Player" do
  before do
    @game = ShoeGame.new
    @game.game_ready
  end

  it "has a capitalized name" do
    @game.player1 = Player.new('larry')
    expect(@game.player1.name).to eq("Larry")
  end
  
  context "each player ready for the game" do

    it "has initial money more than 0 for the game" do  
      # @game.player1 = Player.new('larry')
      expect(@game.player1.money_current).not_to be_zero
    end
  end
end
