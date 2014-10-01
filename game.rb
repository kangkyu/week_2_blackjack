require_relative 'person'
require_relative 'shoe'

class ShoeGame
  attr_accessor :shoe, :dealer, :player1
  def initialize
    @shoe = Shoe.new
    @dealer = Dealer.new
    @player1 = Player.new
  end

  def game_ready
    greet
    shoe.prepare
  end

  def play_round
    first_deal
    dealer.show_second_card
    turn_of player1
    dealer.flip_first_card
    turn_of dealer
    compare_stay_value
  end

  def turn_of(person)
    person.status
    blackjack(person) if person.total_value == 21
    loop do
      if person.instance_of?(Dealer) && dealer > player1
        puts " => #{person.name} stays"
        break
      elsif person.decide_hit?
        puts " => #{person.name} hits"
        person.cards << shoe.cards.pop
        person.status
        bust(person) if person.total_value > 21
      else
        puts " => #{person.name} stays"
        break
      end
    end
  end

  def blackjack(person)
    puts " => #{person.name} blackjack"
    end_round
  end

  def bust(person)
    puts " => #{person.name} busts"
    end_round
  end

  def greet
    puts "Hello, before we start the game, may I have your first name?"
    answer = gets.chomp
    player1.name = answer.capitalize unless answer.empty?
    puts "#{dealer.name} says : Hi, #{player1.name}!"
  end

  def first_deal
    player1.cards.clear
    dealer.cards.clear
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
    end_round
  end

  def end_round
    puts "another round? ('Yes' or 'No')"
    if ask_another_round
      play_round
    else
      puts "Bye-bye"
      exit
    end
  end

  def ask_another_round
    answer = gets.chomp
    case answer.upcase
    when 'Y', 'YES', '1' then true
    when 'N', 'NO', '2', "" then false
    else
      puts "please type 'Yes' or 'No'"
      ask_another_round
    end
  end
end

game = ShoeGame.new
game.game_ready
game.play_round
