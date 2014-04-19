class Card
  attr_accessor :suit, :rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
  def value
    if @rank == 'Ace'
      11
    elsif @rank.to_i == 0
      10
    else
      @rank.to_i
    end
  end
end

class Shoe
  attr_accessor :cards
  def initialize (n)
    @cards = Array.new
    @number_of_deck = n
  end
  def make
    suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
    ranks = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
    (@number_of_deck).times do
      suits.each do |suit|
        ranks.each do |rank|
          self.cards << Card.new(suit, rank)
        end
      end
    end
  end
end

class Person
end
class Player < Person
  attr_accessor :cards, :name, :points, :stay
  def initialize 
    @cards = Array.new
    @points = 0
    @stay = false
  end
  def hit card
    self.cards << card
    self.points += card.value
    "#{card.rank} of #{card.suit} to #{self.name} : #{self.points}"
  end

  def result
    "result"
  end

end

class Dealer < Person
  attr_accessor :cards, :name, :points, :stay
  def initialize 
    @cards = Array.new
    @points = 0
    @stay = false
    @name = 'the dealer'
  end
  def hit card
    self.cards << card
    self.points += card.value
    "#{card.rank} of #{card.suit} to #{self.name} : #{self.points}"
  end
  def ask question
    puts "Dealer: #{question}"
    print 'Player: '
    gets.chomp
  end
  def say something
    puts "Dealer: #{something}"
  end
  def checking (player)
    if player.points > 21
      player.stay = true
      "You are BUSTED!"
    elsif player.points == 21
      player.stay = true
      "You are Black Jack!"
    else
      if self.points > 21
        self.stay = true
        "I am BUSTED!" 
      elsif self.points == 21
        self.stay = true
        "I am Black Jack!" 
      else
        if self.stay && player.stay
          if self.points == player.points
            "Draw"
          elsif self.points < player.points
            "You win"
          else # if self.points > player.points
            "You lose" 
          end
        else
          "game goes on"
        end
      end
    end
  end
end  

# sit on the table
dealer = Dealer.new
me = Player.new
me.name = dealer.ask "What is your name, cowboy?"
me.name.capitalize!
dealer.say "Let's play"

# ready a shoe
num_decks = dealer.ask "How many decks in the shoe, #{me.name}?"
if num_decks.to_i == 0
  dealer.ask "What did you just say?"
else
  shoe = Shoe.new(num_decks.to_i)
end
shoe.make
dealer.say "(shuffle... shuffle... #{shoe.cards.size} cards...)"
shoe.cards.shuffle!

# initial two cards
2.times do
  dealer.say me.hit shoe.cards.shift
  dealer.say dealer.hit shoe.cards.shift
end
dealer.say "#{me.name} has #{me.points}, #{dealer.name} has #{dealer.points}"
dealer.say dealer.checking me
go_on = true

while go_on
  # player turn
  if !me.stay
    hit_or_stay = dealer.ask "Wanna hit? 1) hit 2) stay"
    if !['1','2'].include?(hit_or_stay)
      dealer.ask "What did you just say?"
    elsif hit_or_stay == '1'
      dealer.say me.hit shoe.cards.shift
    else # if me.decision == '2'
      dealer.say "Okay you stay, #{me.name}"
      me.stay = true
    end
    dealer.say dealer.checking me
  end

  # dealer turn
  if !dealer.stay
    if dealer.points < 17
      dealer.say "#{dealer.name} goes hit"
      dealer.say dealer.hit shoe.cards.shift
    else
      dealer.say "#{dealer.name} goes stay.."
      dealer.stay = true
    end
    dealer.say dealer.checking me
  end

  # go on?
  if dealer.stay && me.stay
    go_on = false
    dealer.say dealer.checking me
  end
end