require 'spec_helper'

describe "Hand" do

  context "soft aces counted as 1" do
    before do
      @hand = Hand.new
    end

    it "has total value of 12 when have two Aces" do
      card1 = Card.new('H','A')
      card2 = Card.new('S','A')
      @hand.cards = [card1, card2]
      expect(@hand.total_value).to eq(1 + 11)
    end

    it "has total value not over 21 for three cards include an ace" do
      card1 = Card.new('H','A')
      card2 = Card.new('S','10')
      card3 = Card.new('S','Q')
      @hand.cards = [card1, card2, card3]
      expect(@hand.total_value).to eq(1 + 10 + 10)
    end

    it "has total value counted as the same when originally under 21" do
      card1 = Card.new('H','A')
      card2 = Card.new('S','2')
      card3 = Card.new('S','3')
      @hand.cards = [card1, card2, card3]
      expect(@hand.total_value).to eq(11 + 2 + 3)
    end

    it "has two hard aces in case still over 21 after one ace" do
      card1 = Card.new('H','A')
      card2 = Card.new('S','A')
      card3 = Card.new('S','10')
      card4 = Card.new('S','Q')
      @hand.cards = [card1, card2, card3, card4]
      expect(@hand.total_value).to eq(1 + 1 + 10 + 10)
    end
  end
end
