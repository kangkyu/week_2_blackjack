require_relative 'person'
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
    dealer.show_second_card
    turn_of player1
    dealer.flip_first_card
    turn_of dealer
    compare_stay_value
  end

  def turn_of(person)
    person.status
    person.check_if_blackjack
    loop do
      if person.instance_of?(Dealer) && dealer > player1
        puts " => #{person.name} stays"
        break
      elsif person.decide_hit?
        puts " => #{person.name} hits"
        person.cards << shoe.cards.pop
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
    answer = gets.chomp
    player1.name = answer.capitalize unless answer.empty?
    puts "#{dealer.name} says : Hi, #{player1.name}!"
  end

  def first_deal
    player1.cards << shoe.cards.pop
    dealer.cards << shoe.cards.pop
    player1.cards << shoe.cards.pop
    dealer.cards << shoe.cards.pop
  end

  def compare_stay_value
    if dealer < player1
      puts "#{player1.name} wins"
    elsif dealer > player1
      puts "#{dealer.name} wins"
    else
      puts "Round draw!"
    end
  end
end

game = ShoeGame.new
game.play_round
