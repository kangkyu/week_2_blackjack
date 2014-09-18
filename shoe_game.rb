require_relative 'shoe'
require_relative 'hand'

class ShoeGame
  attr_accessor :shoe, :dealer, :player1
  def initialize
    @shoe = Shoe.new
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
    puts "Hello, before we start the game, may I have your first name?"
    player_name_input = gets.chomp
    unless player_name_input.empty?
      player1.name = player_name_input.capitalize
    end
    puts "#{dealer.name} says : Hi, #{player1.name}!"
  end

  def first_deal
    player1.cards << shoe.deal_one << shoe.deal_one
    dealer.cards << shoe.deal_one << shoe.deal_one
    puts "\n#{dealer.name}'s second card showing:"
    puts dealer.cards.last.full_name.rjust(30)
  end

  def turn_of(person)
    person.check_if_blackjack
    loop do
      if yes_hit = person.decide
        person.hit shoe.deal_one
        person.check_if_busts
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
      dealer.win
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

game = ShoeGame.new
game.run
