require_relative 'player'
require_relative 'dealer'
require_relative 'shoe'

class ShoeGame
  attr_accessor :shoe, :dealer, :player
  def initialize
    @shoe = Shoe.new(6)
    @dealer = Dealer.new
    @player = Player.new
  end

  def game_ready
    # greet_player
  end

  def play_round
    @money_bet_by_player = player.decide_bet_much
    first_deal
    player_turn
    dealer_turn
    compare_stay_value
  end

  private

  def first_deal
    player.clear
    dealer.clear

    puts "Player's first card. hidden to dealer"
    player << shoe.deal_one
    puts "Dealer's first card. hidden to player"
    dealer << shoe.silent_deal_one

    puts "Player's second card"
    player << shoe.deal_one
    puts "Dealer's second card"
    dealer << shoe.deal_one
  end

  def player_turn
    puts "\n#{player.name}'s turn,"
    player.flip_first_card
    player.status
    player_blackjack_and_round_over if player.blackjack?

    loop do
      if player.hit?
        puts " => #{player.name} hits"
        player << shoe.deal_one
        player.status
        player_busts_and_round_over if player.busted?
      else
        puts " => #{player.name} stays"
        break
      end
    end
  end

  def dealer_turn
    puts "Dealer's turn,"
    dealer.flip_first_card
    dealer.status
    dealer_blackjack_and_round_over if dealer.blackjack?

    loop do
      if dealer > player
        puts " => #{dealer.name} stays"
        break
      elsif dealer.hit?
        puts " => #{dealer.name} hits"
        dealer << shoe.deal_one
        dealer.status
        dealer_busts_and_round_over if dealer.busted?
      else
        puts " => #{dealer.name} stays"
        break
      end
    end
  end

  def compare_stay_value
    if dealer < player
      puts "#{player.name} wins"
      player.money_current += @money_bet_by_player
    elsif dealer > player
      puts "#{dealer.name} wins"
      player.money_current -= @money_bet_by_player
    else
      puts "Push!"
      player.money_current += 0
    end
    round_over
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

  def player_blackjack_and_round_over
    puts " => #{player.name} blackjack"
    player.money_current += @money_bet_by_player * 2
    round_over
  end

  def person_blackjack_and_round_over
    puts " => Dealer blackjack"
    player.money_current -= @money_bet_by_player * 2
    round_over
  end

  def player_busts_and_round_over
    puts " => #{person.name} busts"
    player.money_current -= @money_bet_by_player
    round_over
  end

  def dealer_busts_and_round_over
    puts " => Dealer busts"
    player.money_current += @money_bet_by_player
    round_over
  end

  def round_over
    puts "Now you have #{player.money_current}"
    puts "another round? ('Yes' or 'No')"
    if another_round?
      play_round
    else
      puts "Bye-bye"
      end_game
    end
  end

  def greet_player
    puts "Hello, before we start the game, may I have your first name?"
    answer = gets.chomp
    @player.name ||= answer.capitalize
    puts "Hi, #{player.name}!"
  end

  def end_game
    exit
  end
end
