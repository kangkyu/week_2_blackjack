require 'shoe_game'

describe "Shoe Game" do

  before do
    @game = ShoeGame.new
    @game.game_ready
  end

  # game rule
  it "has all the cards with its face value integer" do
    @game.shoe.each_card do |card|
      expect(card.face_value.is_a?(Integer)).to eq(true)
    end
  end

  it "all the face values are not zero" do
    @game.shoe.each_card do |card|
      expect(card.face_value).not_to be_zero
    end
  end

  # context "soft aces counted as 1" do
  #   it "has total value of 12 when have two Aces" do
  #     player1 = Player.new
  #     player1.cards = [Card.new('H','A'), Card.new('S','A')]
  #     player1.cards.each {|card| card.set_face_value }
  #     expect(player1.total_value).to eq(1 + 11)
  #   end

  #   it "has total value not over 21 for three cards include an ace" do
  #     player1 = Player.new
  #     player1.cards = [Card.new('H','A'), Card.new('S','10'), Card.new('S','Q')]
  #     player1.cards.each {|card| card.set_face_value }
  #     expect(player1.total_value).to eq(1 + 10 + 10)
  #   end

  #   it "has total value counted as the same when originally under 21" do
  #     player1 = Player.new
  #     player1.cards = [Card.new('H','A'), Card.new('S','2'), Card.new('S','3')]
  #     player1.cards.each {|card| card.set_face_value }
  #     expect(player1.total_value).to eq(11 + 2 + 3)
  #   end

  #   it "has two hard aces in case still over 21 after one ace" do
  #     player1 = Player.new
  #     player1.cards = [Card.new('H','A'), Card.new('S','A'), Card.new('S','10'), Card.new('S','Q')]
  #     player1.cards.each {|card| card.set_face_value }
  #     expect(player1.total_value).to eq(1 + 1 + 10 + 10)
  #   end
  # end

end