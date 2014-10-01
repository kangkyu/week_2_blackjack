require_relative 'card'

class Person
  attr_accessor :cards, :name
  def initialize(name)
    @cards = Array.new
    @name = name.capitalize
  end

  def check_if_blackjack
    if total_value == 21
      puts " => #{name} blackjack"
      exit
    end
  end

  def check_if_busts
    if total_value > 21
      puts " => #{name} busts"
      exit
    end
  end

  def total_value
    total = cards.map{|card| card.face_value}.reduce{|sum, face_value| sum + face_value}

    aces_count.times do
      total > 21 ? total -= 10 : break
    end
    total
  end

  def aces_count
    cards.select{|card| card.is_ace?}.size
  end

  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each do |card|
      puts "#{card}".rjust(30) + "#{card.face_value}".rjust(3)
    end
  end

  def decide_hit?
    puts "\n#{name}'s turn,"
    ask_if_hit
  end

end

class Player < Person
  def initialize(name = 'player')
    super
  end

  def ask_if_hit
    puts "hit or stay?"
    answer = gets.chomp
    case answer.downcase
    when 'hit', '1' then true
    when 'stay', '2' then false
    else
      puts "please type 'hit' or 'stay'"
      ask_if_hit
    end
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

  def flip
    puts "#{name}'s first card was: #{cards.first}" + "#{cards.first.face_value}".rjust(3)
  end
end