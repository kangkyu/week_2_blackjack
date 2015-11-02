require_relative 'person'

class Player < Person
  START_AMOUNT = 100
  attr_accessor :money_current, :money_bet

  def initialize(name = 'player', option = {})
    super(name)
    @money_current = option[:money] || START_AMOUNT
    @money_bet = 0
  end

  def name=(name)
    @name = name.split(/\W/).map(&:capitalize).join(' ')
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
    bet = gets.chomp.to_i
    if bet > 0
      @money_bet = bet
    else
      decide_bet_much  
    end
  end

  def wins
    @money_current += money_bet
  end

  def loses
    @money_current -= money_bet
  end
end
