class ShoeGame
  NUM_DECKS = 6
  attr_accessor :shoe, :dealer, :player1
  def initialize 
    @shoe = Deck.new(NUM_DECKS)
    @dealer = Dealer.new
    @player1 = Player.new
    shoe.shuffle!
  end

  def run
    greet
    first_deal
    turn_of player1
    dealer.flip
    turn_of dealer
    compare_stay_value
  end

  def greet
    dealer.name = 'dealer'
    player1.name = 'Jones'
    puts "#{dealer.name} says : Hi, #{player1.name}!"
  end

  def first_deal
    player1.cards << shoe.deal_one << shoe.deal_one
    dealer.cards << shoe.deal_one << shoe.deal_one
    puts "\n#{dealer.name}'s second card showing:"
    puts dealer.cards.last.full_name.rjust(30)
  end

  def turn_of(person)
    person.status
    person.check_if_blackjack
    loop do
      if yes_hit = person.decide
        person.hit shoe.deal_one
        person.check_if_done
      else
        person.stay
        break
      end
    end
  end

  def compare_stay_value
    if dealer.total_value < player1.total_value
      player1.win
    elsif dealer.total_value > player1.total_value
      player1.lose
    else
      draw
    end
  end

  def shoe_size
    puts
    puts shoe.size
  end

  def draw
    puts "Round draw!"
  end
end

module Hand
  attr_accessor :cards
  def initialize
    @cards = Array.new
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

  def check_if_blackjack
    if total_value == 21
      blackjack
      exit
    end
  end

  def check_if_done()
    status
    if total_value > 21
      bust
      exit
    end
  end

  def status
    puts "\n#{name} has now total value : #{total_value}"
    cards.each do |card|
      puts card.full_name.rjust(30)
    end
  end

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
end

class Player
  include Hand

  attr_accessor :name, :cards
  def initialize(name = 'player')
    @name = name.capitalize
    @cards = Array.new
  end

  def win
    puts "#{name} wins"
  end

  def lose
    puts "#{name} loses"
  end

  def decide
    puts "\n#{name}'s turn,"
    ask_if_hit
  end

  def ask_if_hit
    puts "hit or stay?"
    answer = gets.chomp
    case answer
    when 'hit'
      true
    when 'stay'
      false
    when '1'
      true
    when '2'
      false
    else
      puts "please type 'hit' or 'stay'"
      ask_if_hit
    end
  end
end

class Dealer
  include Hand

  attr_accessor :cards, :name
  def initialize
    @cards = Array.new
    @name = 'dealer'
  end

  def decide
    puts "\n#{name}'s turn,"
    hit_by_rule
  end

  def hit_by_rule
    if total_value > 17
      false
    else
      true
    end
  end

  def flip
    puts "#{name}'s first card was: #{cards.first.full_name}"
  end
end

class Deck
  attr_accessor :cards
  def initialize(n=1)
    @cards = Array.new
    suit = ['D','C','H','S']
    rank = ['2','3','4','5','6','7','8','9','10','J','K','Q','A']
    num_of_decks = n
    num_of_decks.times do
      suit.product(rank).each {|s,r| cards << Card.new(s,r)}
    end
  end

  def size
    cards.size
  end

  def deal_one
    cards.pop
  end

  def shuffle!
    cards.shuffle!
  end
end

class Card
  attr_accessor :rank, :suit
  def initialize(s,r)
    @suit = s
    @rank = r
  end

  def face_value 
    if rank == 'A'
      11
    elsif rank.to_i == 0
      10
    else
      rank.to_i
    end
  end

  def full_name
    "#{rank_name} of #{suit_name}"
  end

  def rank_name
    "#{to_word(rank)}"
  end

  def suit_name
    "#{to_word(suit)}"
  end

  private
  def to_word(c)
    case c
    when 'D' then "Diamonds" 
    when 'C' then "Clubs"
    when 'H' then "Hearts"
    when 'S' then "Spades"
    when '2' then "Two"
    when '3' then "Three"
    when '4' then "Four"
    when '5' then "Five"
    when '6' then "Six"
    when '7' then "Seven"
    when '8' then "Eight"
    when '9' then "Nine"
    when '10' then "Ten"
    when 'J' then "Jack"
    when 'K' then "King"
    when 'Q' then "Queen"
    when 'A' then "Ace"
    end
  end
end

game = ShoeGame.new
game.run