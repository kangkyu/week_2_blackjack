
require 'hand'

describe "Hand" do

  context "soft aces counted as 1" do
    before do
      @hand = Hand.new
    end

    it "has total value of 12 when have two Aces" do
      @hand.cards = [Card.new('H','A'), Card.new('S','A')]
      @hand.each_card {|card| card.set_face_value }
      expect(@hand.total_value).to eq(1 + 11)
    end

    it "has total value not over 21 for three cards include an ace" do
      @hand.cards = [Card.new('H','A'), Card.new('S','10'), Card.new('S','Q')]
      @hand.each_card {|card| card.set_face_value }
      expect(@hand.total_value).to eq(1 + 10 + 10)
    end

    it "has total value counted as the same when originally under 21" do
      @hand.cards = [Card.new('H','A'), Card.new('S','2'), Card.new('S','3')]
      @hand.each_card {|card| card.set_face_value }
      expect(@hand.total_value).to eq(11 + 2 + 3)
    end

    it "has two hard aces in case still over 21 after one ace" do
      @hand.cards = [Card.new('H','A'), Card.new('S','A'), Card.new('S','10'), Card.new('S','Q')]
      @hand.each_card {|card| card.set_face_value }
      expect(@hand.total_value).to eq(1 + 1 + 10 + 10)
    end
  end
end
