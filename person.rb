require_relative 'card'

class Person
  include Comparable

  attr_accessor :cards, :name
  def initialize(name)
    @cards = Array.new
    @name = name.capitalize
  end

  def check_if_blackjack
    status
    if total_value == 21
      puts " => #{name} blackjack"
      exit
    end
  end

  def check_if_busts
    status
    if total_value > 21
      puts " => #{name} busts"
      exit
    end
  end

  def total_value
    total = face_value_sum
    soft_aces_count.times do
      if total > 21 
        soft_first_at = cards.find_index{|card| card.face_value == 11}
        cards[soft_first_at].face_value = 1
        total = face_value_sum
      else
        break
      end
    end
    total
  end

  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each {|card| puts card}
  end

  def decide_hit?
    puts "\n#{name}'s turn,"
    ask_if_hit
  end

  def <=>(other)
    total_value <=> other.total_value
  end

private
  def soft_aces_count
    cards.count{|card| card.face_value == 11}
  end

  def face_value_sum
    cards.map{|card| card.face_value}.reduce(0, :+)
  end
end

class Player < Person
  def initialize(name = 'player')
    super
    @money = 100
  end

  def ask_if_hit
    puts "hit or stay, #{name}?"
    answer = gets.chomp
    case answer.downcase
    when 'hit', '1' then true
    when 'stay', '2' then false
    else
      puts "please type 'hit' or 'stay'"
      ask_if_hit
    end
  end

  def ask_money
    puts "how much do you bet?"
    puts "you have #{money}"
  end
end

class Dealer < Person
  def initialize(name = 'dealer')
    super
  end

  def ask_if_hit
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