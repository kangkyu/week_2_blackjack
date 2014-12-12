require 'shoe_game'

describe "Player" do
  before do
    @game = ShoeGame.new
    @game.game_ready
  end

  context "each player ready for the game" do
    it "has a capitalized name" do
      @game.player1 = Player.new('larry')
      expect(@game.player1.name).to eq("Larry")
    end

    it "has an initial money" do  
      player1 = Player.new("larry", 100)
      expect(player1.money_current).to eq(100)
    end
  end

  it "gets cards with face value" do
    @game.player1 << @game.shoe.deal_one
    expect(@game.player1.cards.first.face_value).not_to be_nil
  end

  context "soft aces counted as 1" do
    it "has total value of 12 when have two Aces" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','A')]
      player1.cards.each {|card| card.set_face_value }
      expect(player1.total_value).to eq(1 + 11)
    end

    it "has total value not over 21 for three cards include an ace" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','10'), Card.new('S','Q')]
      player1.cards.each {|card| card.set_face_value }
      expect(player1.total_value).to eq(1 + 10 + 10)
    end

    it "has total value counted as the same when originally under 21" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','2'), Card.new('S','3')]
      player1.cards.each {|card| card.set_face_value }
      expect(player1.total_value).to eq(11 + 2 + 3)
    end

    it "has two hard aces in case still over 21 after one ace" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','A'), Card.new('S','10'), Card.new('S','Q')]
      player1.cards.each {|card| card.set_face_value }
      expect(player1.total_value).to eq(1 + 1 + 10 + 10)
    end
  end
end