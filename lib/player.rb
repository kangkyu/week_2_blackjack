require_relative 'person'

class Player < Person
  START_AMOUNT = 100

  attr_accessor :money_current
  def initialize(name = 'player', money = START_AMOUNT)
    super(name)
    @money_current = money
  end

  def hit?
    puts "hit or stay, #{name}?"
    answer = gets.chomp
    case answer.downcase
    when 'hit', 'h', '1' then true
    when 'stay', 's' ,'2' then false
    else
      puts "please type 'hit' or 'stay'"
      hit?
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