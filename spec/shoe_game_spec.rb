require 'spec_helper'

describe "Shoe Game" do
  before do
    @game = ShoeGame.new
  end

  # game rule
  context "cards have their face values" do

    it "all the cards with its face value integer" do
      @game.shoe.each_card do |card|
        expect(card.face_value.is_a?(Integer)).to eq(true)
      end
    end

    it "all the face values are not zero" do
      @game.shoe.each_card do |card|
        expect(card.face_value).not_to be_zero
      end
    end
  end
  
  context "each player ready for the game" do

    it "has initial money more than 0 for the game" do
      # @game.player = Player.new('larry')
      expect(@game.player.money_current).not_to be_zero
    end
  end
end
