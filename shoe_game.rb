require_relative 'hand'
require_relative 'shoe'

class ShoeGame
  attr_accessor :shoe, :dealer, :player1
  def initialize
    @shoe = Shoe.new
    @dealer = Dealer.new
    @player1 = Player.new
  end

  def play_round
    greet
    shoe.prepare
    first_deal
    puts shoe.size
    turn_of player1
    puts shoe.size
    dealer.flip
    turn_of dealer
    puts shoe.size
    compare_stay_value
  end

  def turn_of(person)
    person.status
    person.check_if_blackjack
    loop do
      if person.decide_hit?
        puts " => #{person.name} hits"
        person.cards.push shoe.cards.pop
        person.status
        person.check_if_busts
      else
        puts " => #{person.name} stays"
        break
      end
    end
  end

  def greet
    puts "Hello, before we start the game, may I have your first name?"
    player_name_input = gets.chomp
    player1.name = player_name_input.capitalize unless player_name_input.empty?
    puts "#{dealer.name} says : Hi, #{player1.name}!"
  end

  def first_deal
    player1.cards.push shoe.cards.pop, shoe.cards.pop
    dealer.cards.push shoe.cards.pop, shoe.cards.pop
    puts "\n#{dealer.name}'s second card showing:"
    puts "#{dealer.cards.last}".rjust(30) + "#{dealer.cards.last.face_value}".rjust(3)
  end

  def compare_stay_value
    if dealer.total_value < player1.total_value
      puts "#{player1.name} wins"
    elsif dealer.total_value > player1.total_value
      puts "#{dealer.name} wins"
    else
      puts "Round draw!"
    end
  end
end

game = ShoeGame.new
game.play_round
