class Game
  attr_accessor :deck, :dealer_cards, :player_cards
  @@suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
  @@ranks = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
  def initialize
    @deck = @@suits.product(@@ranks).shuffle!
    @dealer_cards = Cards.new
    @player_cards = Cards.new
  end
  def deal_first
    2.times do
      self.deal_player
      self.deal_dealer
    end
  end
  def deal_player
    self.player_cards << self.deck.shift
    puts "player now got #{self.player_cards}"
  end
  def deal_dealer
    self.dealer_cards << self.deck.shift
    puts "dealer now got #{self.dealer_cards}"
  end
  def status
    player_count = self.player_cards.count
    dealer_count = self.dealer_cards.count
    puts "----------------------" 
    puts "player".ljust(10) + "#{self.player_cards.size} cards".rjust(10)
    puts "dealer".ljust(10) + "#{self.dealer_cards.size} cards".rjust(10)
    puts "deck".ljust(10) + "#{self.deck.size} cards left".rjust(10)
    puts "----------------------"
    puts "player_cards".ljust(10) + "#{player_count} points".rjust(10)
    puts "dealer_cards".ljust(10) + "#{dealer_count} points".rjust(10)
    puts "----------------------"
    if (player_count < 21 && dealer_count < 21)
      true
    else
      false
    end
  end
  def end_comment
    player_count = self.player_cards.count
    dealer_count = self.dealer_cards.count
    if (player_count > 21 && dealer_count > 21) || (player_count == dealer_count)
      "Draw game"
    else
      if player_count > 21
        "You are BUSTED!"
      elsif player_count == 21
        "You are Black Jack!"
      elsif dealer_count > 21
        "I am BUSTED!" 
      elsif dealer_count == 21
        "I am Black Jack!" 
      else
        if player_count > dealer_count
          "You win"
        elsif player_count < dealer_count
          "You lose"
        else
          "what is this?"
        end
      end
    end
  end
end

class Cards < Array
  @@ace = false
  def count
    count = 0
    self.each do |suit, rank|
      if rank == 'Ace'
        count += 11
        @@ace = true
      elsif rank.to_i == 0
        count += 10
      else
        count += rank.to_i
      end
    end
    if @@ace && count > 21
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
  @@dealers = ['John', 'Kim', 'Lam', 'Lale']
  def initialize
    @name = @@dealers[rand(@@dealers.size)]
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

game = Game.new

# and player + dealer sitting
dealer = Dealer.new
player = Player.new
dealer.say "Hi, I'm dealer, my name is #{dealer.name}."
player.name = (dealer.ask "What's your name?").capitalize
dealer.say "Nice to meet you, #{player.name}. Let's start."
game.deck = game.deck * (dealer.ask "Wait, how many deck?").to_i
game.deck.shuffle!
# puts "cards in this game #{game.deck} and #{game.deck.size} in total"
dealer.say "(that's #{game.deck.size} cards. shuffle... shuffle... )"
sleep 2

# continue
continue = true
while continue

# first deal - two cards each (and count)
game.deal_first

not_finished = game.status
player_stay = false
dealer_stay = false
while not_finished && !(dealer_stay && player_stay)
  if !player_stay
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
  if game.dealer_cards.count < 17
    puts "dealer hit"
    game.deal_dealer
  else
    puts "dealer stay"
    dealer_stay = true
  end
  not_finished = game.status
end

puts "game end"
dealer.say game.end_comment

#
c_answer = dealer.ask "continue? 1) yes 2) no"
  if c_answer == '1'
    game.dealer_cards.clear
    game.player_cards.clear
    continue = true
  else
    continue = false
  end
end
exit
