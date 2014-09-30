module Hand
  def total_value
    total = 0
    cards.each do |card|
      total += card.face_value
    end
    has_aces.each do
      total > 21 ? total -= 10 : break
    end
    total
  end

  def has_aces
    cards.select{|card| card.rank == 'A'}
  end
  
  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each do |card|
      puts "#{card}".rjust(30)
    end
  end
end

class Person
  include Hand

  attr_accessor :cards, :name
  def initialize(name)
    @cards = Array.new
    @name = name.capitalize
  end

  def hit(card)
    puts " => #{name} hits"
    cards << card
  end

  def stay
    puts " => #{name} stays"
  end

  def bust
    puts " => #{name} busts"
  end

  def blackjack
    puts " => #{name} blackjack"
  end

  def win
    puts "#{name} wins"
  end

  def check_if_blackjack
    status
    if total_value == 21
      blackjack
      exit
    end
  end

  def check_if_busts
    status
    if total_value > 21
      bust
      exit
    end
  end

end

class Player < Person
  def initialize(name = 'player')
    super
  end

  def decide_hit?
    puts "\n#{name}'s turn,"
    ask_if_hit
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

  def decide_hit?
    puts "\n#{name}'s turn,"
    sleep 1
    hit_by_rule
  end

  def hit_by_rule
    total_value < 17
  end

  def flip
    puts "#{name}'s first card was: #{cards.first}"
  end
end