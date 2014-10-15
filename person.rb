require_relative 'card'
require_relative 'hand'

class Person
  include Comparable
  include Hand

  attr_accessor :cards, :name
  def initialize(name)
    @cards = Array.new
    @name = name.capitalize
  end

  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each {|card| puts card}
  end

  def <=>(other)
    total_value <=> other.total_value
  end
end

class Player < Person
  START_AMOUNT = 100

  attr_accessor :money_current
  def initialize(name = 'player', money = START_AMOUNT)
    super(name)
    @money_current = money
  end

  def greet
    puts "Hello, before we start the game, may I have your first name?"
    answer = gets.chomp
    name = answer.capitalize unless answer.empty?
    puts "Hi, #{name}!"
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

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def hit?
    sleep 1
    total_value < 17
  end

  def flip_first_card
    puts "#{name}'s first card was:" 
    puts cards[0]
  end

  def show_second_card
    puts "#{name}'s second card showing:"
    puts cards[1]
  end
end
