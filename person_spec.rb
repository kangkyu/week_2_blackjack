require_relative 'person'

describe "Player" do

  it "has a capitalized name" do
    player1 = Player.new("larry")
    player1.name.should == "Larry"
  end


  it "has an initial money" do  
    player1 = Player.new("larry",100)
    player1.money_current.should == 100
  end

  context "soft aces counted as 1" do
    it "has total value of 12 when have two Aces" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','A')]
      player1.cards.each {|card| card.set_face_value }
      player1.total_value.should == 1 + 11
    end

    it "has total value not over 21 for three cards include an ace" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','10'), Card.new('S','Q')]
      player1.cards.each {|card| card.set_face_value }
      player1.total_value.should == 1 + 10 + 10
    end

    it "has total value counted as the same when originally under 21" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','2'), Card.new('S','3')]
      player1.cards.each {|card| card.set_face_value }
      player1.total_value.should == 11 + 2 + 3
    end

    it "has two hard aces in case still over 21 after one ace" do
      player1 = Player.new
      player1.cards = [Card.new('H','A'), Card.new('S','A'), Card.new('S','10'), Card.new('S','Q')]
      player1.cards.each {|card| card.set_face_value }
      player1.total_value.should == 1 + 1 + 10 + 10
    end
  end
end