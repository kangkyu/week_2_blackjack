require_relative 'dealer'
require_relative 'player'
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
    shoe.each_card {|card| card.set_face_value }
  end

  def play_round
    @money_bet = player1.ask_bet_much
    first_deal
    dealer.show_second_card
    turn_of player1
    dealer.flip_first_card
    turn_of dealer
    compare_stay_value
  end

  def first_deal
    player1.clear
    dealer.clear
    player1 << shoe.deal_one
    dealer << shoe.deal_one
    player1 << shoe.deal_one
    dealer << shoe.deal_one
  end

  def turn_of(person)
    person.status
    blackjack(person) if person.total_value == 21
    puts "\n#{person.name}'s turn,"
    loop do
      if person.is_a?(Dealer) && dealer > player1
        puts " => #{person.name} stays"
        break
      elsif person.hit?
        puts " => #{person.name} hits"
        person << shoe.deal_one
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
    if person.is_a?(Player)
      player1.money_current += @money_bet * 2
    else
      player1.money_current -= @money_bet * 2
    end 
    end_round
  end

  def bust(person)
    puts " => #{person.name} busts"
    if person.is_a?(Player)
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
      end_game
    end
  end

  def another_round?
    answer = gets.chomp
    case answer.downcase
    when 'y', 'yes', '1' then true
    when 'n', 'no', '2', 'exit', "quit", "" then false
    else
      puts "please type 'Yes' or 'No'"
      another_round?
    end
  end

  def end_game
    exit
  end
end