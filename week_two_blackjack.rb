class Game
  attr_accessor :deck, :dealer_cards, :player_cards
  SUITS = ['Spade', 'Club', 'Heart', 'Diamond']
  RANKS = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
  def initialize
    @deck = SUITS.product(RANKS).shuffle!
    @dealer_cards = Cards.new
    @player_cards = Cards.new
  end

  def deal_player
    self.player_cards << self.deck.shift
    puts "player now got, #{self.player_cards.join(' ')}"
  end
  def deal_dealer
    self.dealer_cards << self.deck.shift
    puts "dealer now got, #{self.dealer_cards.join(' ')}"
  end

  def status
    puts "----------------------" 
    puts "player".ljust(5) + "#{self.player_cards.count} points".rjust(10)
    puts "dealer".ljust(5) + "#{self.dealer_cards.count} points".rjust(10)
    # puts "#{self.deck.size} cards left in the deck"
    puts "----------------------"
  end

  def end_comment
    player_count = self.player_cards.count
    dealer_count = self.dealer_cards.count
    if (player_count > 21 && dealer_count > 21) || (player_count == dealer_count)
      "Draw game"
    else
      if dealer_count > 21
        "I am BUSTED!" 
      elsif player_count > 21
        "You are BUSTED!"
      elsif dealer_count == 21
        "I am Black Jack!" 
      elsif player_count == 21
        "You are Black Jack!"
      else
        if player_count > dealer_count
          "You win"
        else
          "You lose"
        end
      end
    end
  end
end

class Cards < Array
  def count
    ace_is = false
    count = 0
    self.each do |suit, rank|
      if rank == 'Ace'
        count += 11
        ace_is = true
      elsif rank.to_i == 0
        count += 10
      else
        count += rank.to_i
      end
    end
    if ace_is && count > 21
      count - 10
    else
      count
    end
  end
end

class Player
  attr_accessor :name
end

class Dealer
  attr_reader :name
  DEALERS = ['John', 'Kim', 'Lam', 'Lale']
  def initialize
    @name = DEALERS[rand(DEALERS.size)]
  end
  def say something
    puts "=> Dealer: #{something}"
  end
  def ask question
    puts "=> Dealer: #{question}"
    print "Player: "
    gets.chomp
  end
end

class Blackjack
  attr_accessor :game, :dealer, :player
  def initialize
    # start a game
    @game = Game.new

    # player + dealer sitting
    @dealer = Dealer.new
    @player = Player.new
  end

  def run
    dealer.say "Hi, I'm dealer, my name is #{dealer.name}."
    player.name = (dealer.ask "What's your name?").capitalize
    dealer.say "Nice to meet you, #{player.name}. Let's start."

    # prepare the shoe
    game.deck = game.deck * ((dealer.ask "Wait, how many deck?").to_i)
    game.deck.shuffle!
    # puts "cards in this game #{game.deck} and #{game.deck.size} in total"
    dealer.say "(that's #{game.deck.size} cards. shuffle... shuffle... )"
    sleep 2

    # play loop - while player in, until cards last
    in_play = true
    while in_play
      if game.deck.size < 10
        dealer.say "We need more cards to play. Bye-bye!"
        break
      end

      # first deal - two cards each (and count)
      2.times do
          game.deal_player
          game.deal_dealer
      end
       
      # status (1) after deal first two cards
      game.status

      # rally loop - while both under 21 and not both stay
      # it's pass for either one who stays
      player_stay = false
      dealer_stay = false
      while (game.player_cards.count < 21 && game.dealer_cards.count < 21) && !(dealer_stay && player_stay)
      
        unless player_stay 
          # ask player whether hit or stay
          # - deal a card to player if answer hit
          # - move on to next person if answer stay
          # - loop start over if answer not hit or stay ('1' or '2')
          player_decide = dealer.ask "1) hit or 2) stay?"
          if player_decide == '1'
            puts "player hit"
            game.deal_player
          elsif player_decide == '2'
            puts "player stay"
            player_stay = true
          else 
            dealer.ask "Sorry I couldn't hear you, 1) hit or 2) stay?"
            next 
          end
        end

        # by house rule, dealer always stay if over 17
        # and always hit if equal or less than 17
        # - no need to go if the player already over 21
        unless (dealer_stay || game.player_cards.count >= 21)
          if game.dealer_cards.count < 17
            puts "dealer hit"
            game.deal_dealer
          else
            puts "dealer stay"
            dealer_stay = true
          end
        end

        # status (2) at the end of each turn
        game.status 

      end 
      # end of rally loop

      puts "end of play"
      dealer.say game.end_comment #

      # start over this 'play' while loop 
      # (+ clear cards on the table) if still in
      in_answer = dealer.ask "continue? 1) yes"
      if in_answer == '1'
        game.dealer_cards.clear
        game.player_cards.clear
        in_play = true
      else
        in_play = false
      end

    end 
    # end of play loop
  end
end

Blackjack.new.run
exit