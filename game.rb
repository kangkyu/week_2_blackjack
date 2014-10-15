require_relative 'person'
require_relative 'shoe'

class ShoeGame
  DEFAULT_NUM_OF_DECKS = 6

  attr_reader :shoe
  attr_accessor :dealer, :player1
  def initialize
    @shoe = Shoe.new(DEFAULT_NUM_OF_DECKS)
    @dealer = Dealer.new
    @player1 = Player.new
  end

  def game_ready
    player1.greet
    shoe.cards.each {|card| card.set_face_value }
  end

  def play_round
    @money_bet = player1.ask_bet
    first_deal
    dealer.show_second_card
    turn_of player1
    dealer.flip_first_card
    turn_of dealer
    compare_stay_value
  end

  def first_deal
    player1.cards.clear
    dealer.cards.clear
    player1.cards << shoe.cards.pop
    dealer.cards << shoe.cards.pop
    player1.cards << shoe.cards.pop
    dealer.cards << shoe.cards.pop
  end

  def turn_of(person)
    person.status
    blackjack(person) if person.total_value == 21
    puts "\n#{person.name}'s turn,"
    loop do
      if person.instance_of?(Dealer) && dealer >= player1
        puts " => #{person.name} stays"
        break
      elsif person.hit?
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
    if person.instance_of?(Player)
      player1.money_current += @money_bet * 2
    else
      player1.money_current -= @money_bet * 2
    end 
    end_round
  end

  def bust(person)
    puts " => #{person.name} busts"
    if person.instance_of?(Player)
      player1.money_current -= @money_bet 
    else
      player1.money_current += @money_bet
    end
    end_round
  end

  def compare_stay_value
    if dealer < player1
      puts "#{player1.name} wins"
      player1.money_current += @money_bet
    elsif dealer > player1
      puts "#{dealer.name} wins"
      player1.money_current -= @money_bet
    else
      puts "Push!"
      player1.money_current += 0
    end
    end_round
  end

  def end_round
    puts "Now you have #{player1.money_current}"
    puts "another round? ('Yes' or 'No')"
    if another_round?
      play_round
    else
      puts "Bye-bye"
      exit
    end
  end

  def another_round?
    answer = gets.chomp
    case answer.upcase
    when 'Y', 'YES', '1' then true
    when 'N', 'NO', '2', 'EXIT', "", "QUIT" then false
    else
      puts "please type 'Yes' or 'No'"
      another_round?
    end
  end

end

game = ShoeGame.new
game.game_ready
game.play_round
