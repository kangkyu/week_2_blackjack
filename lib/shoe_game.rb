require_relative 'player'
require_relative 'dealer'
require_relative 'shoe'

class ShoeGame
  attr_accessor :shoe, :dealer, :player
  def initialize
    puts "\n=== ShoeGame.initialize ==="
    @shoe = Shoe.new(6)
    @dealer = Dealer.new
    @player = Player.new
  end

  def game_ready
    puts "\n=== ShoeGame.game_ready ==="
    greet_player
  end

  def play_round
    puts "\n=== ShoeGame.play_round ==="
    player.money_bet = player.decide_bet_much
    first_deal
    player_turn
    dealer_turn
    compare_stay_value
  end

  private

  def first_deal
    puts "\n=== ShoeGame.first_deal ==="
    player.clear
    dealer.clear

    player << shoe.deal_one
    dealer << shoe.silent_deal_one

    player << shoe.deal_one
    dealer << shoe.deal_one
  end

  def player_turn
    puts "\n=== ShoeGame.player_turn ==="
    puts "\n=== #{player.name}'s turn ==="
    # player.flip_first_card
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
    puts "\n=== ShoeGame.dealer_turn ==="
    puts "\n=== #{dealer.name}'s turn ==="
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
    puts "\n=== ShoeGame.compare_stay_value ==="
    if dealer < player
      puts "#{player.name} wins"
      player.money_current += player.money_bet
    elsif dealer > player
      puts "#{dealer.name} wins"
      player.money_current -= player.money_bet
    else
      puts "Push!"
      player.money_current += 0
    end
    round_over
  end

  def another_round?
    puts "\n=== ShoeGame.another_round ==="
    puts "another round? ('Yes' or 'No')"
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
    puts "\n=== ShoeGame.player_blackjack_and_round_over ==="
    puts " => #{player.name} blackjack"
    player.money_current += player.money_bet * 2
    round_over
  end

  def dealer_blackjack_and_round_over
    puts "\n=== ShoeGame.dealer_blackjack_and_round_over ==="
    puts " => #{dealer.name} blackjack"
    player.money_current -= player.money_bet * 2
    round_over
  end

  def player_busts_and_round_over
    puts "\n=== ShoeGame.player_busts_and_round_over ==="
    puts " => #{player.name} busts"
    player.money_current -= player.money_bet
    round_over
  end

  def dealer_busts_and_round_over
    puts "\n=== ShoeGame.dealer_busts_and_round_over ==="
    puts " => #{dealer.name} busts"
    player.money_current += player.money_bet
    round_over
  end

  def round_over
    puts "\n=== ShoeGame.round_over ==="
    puts "\n=== ShoeGame.Round is over ==="
    puts "Now #{player.name} has #{player.money_current}"
    if another_round?
      play_round
    else
      puts "Bye-bye"
      end_game
    end
  end

  def greet_player
    puts "\n=== ShoeGame.greet_player ==="
    puts "Hello, before we start the game, may I have your first name?"
    answer = gets.chomp
    player.name = answer.capitalize
    puts "Hi, #{player.name}!"
  end

  def end_game
    puts "\n=== ShoeGame.end_game ==="
    exit
  end
end
