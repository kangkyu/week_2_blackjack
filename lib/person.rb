require_relative 'shoe'

class Hand
  include WithMultipleCards

  attr_accessor :cards
  def initialize
    @cards = []
  end

  def total_value
    soft_aces_count.times do
      cards[soft_first_at].face_value = 1 if face_value_sum > 21 
    end
    face_value_sum
  end

  private
  
  def soft_aces_count
    cards.count{|card| card.face_value == 11}
  end

  def face_value_sum
    cards.map{|card| card.face_value}.reduce(0, :+)
  end

  def soft_first_at
    cards.find_index{|card| card.face_value == 11}
  end
end

class Person
  include Comparable

  attr_accessor :hand, :name
  def initialize(name)
    @name = name.capitalize
    @hand = Hand.new
  end

  def hit?
    decide_hit
  end

  def status
    puts "\n#{name} has now total value : #{hand.total_value}"
    hand.each_card {|card| puts card}
  end

  def <=>(other)
    hand.total_value <=> other.hand.total_value
  end

  def clear
    hand.cards.clear
  end

  def push(*arg)
    hand.cards.push(*arg)
  end

  def <<(arg)
    hand.cards << arg
  end
end

class Player < Person
  START_AMOUNT = 100

  attr_accessor :money_current
  def initialize(name = 'player', money = START_AMOUNT)
    super(name)
    @money_current = money
  end

  def decide_hit
    puts "hit or stay, #{name}?"
    answer = gets.chomp
    case answer.downcase
    when 'hit', 'h', '1' then true
    when 'stay', 's' ,'2' then false
    else
      puts "please type 'hit' or 'stay'"
      decide_hit
    end
  end

  def ask_bet_much
    puts "how much do you bet? you have #{money_current}"
    answer = gets.chomp
    if answer.empty?
      ask_bet_much
    else
      answer.to_i
    end
  end
end

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def decide_hit
    sleep 1
    hand.total_value < 17
  end

  def flip_first_card
    puts "#{name}'s first card was:"
    puts hand.cards[0]
  end

  def show_second_card
    puts "#{name}'s second card showing:"
    puts hand.cards[1]
  end
end
