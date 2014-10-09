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
end