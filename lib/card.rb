require_relative 'deck'

class Card

  attr_reader :rank, :suit
  attr_accessor :face_value
  def initialize(s,r)
    @suit,@rank = s,r
  end

  def to_s
    "#{Deck::RANK_NAME[rank]} of #{Deck::SUIT_NAME[suit]}".rjust(30) + "#{face_value}".rjust(3)
  end

  def face_value
    if rank.include? 'A'
      @face_value || 11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end
end
