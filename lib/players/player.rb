require_relative 'person'

class Player < Person
  START_AMOUNT = 100

  attr_accessor :money_current, :money_bet
  def initialize(name = 'player', money = START_AMOUNT)
    super(name)
    @money_current = money
    @money_bet = 0
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

  def decide_bet_much
    puts "how much do you bet? you have #{money_current}"
    answer = gets.chomp
    if answer.to_i > 0
      answer.to_i
    else
      decide_bet_much  
    end
  end
end
