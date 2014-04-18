class Cards
  attr_accessor :cards
  def initialize
    @cards = Array.new
  end
end

class Shoe < Cards
  def initialize (num)
    @num_of_decks = num
  end
  def fill!
    deck = Deck.new
    deck.prepare!
    self.cards = deck.cards * @num_of_decks
  end
end

class Deck < Cards
  def prepare!
    suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
    ranks = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(suit, rank)
        self.cards << card
      end
    end
  end
end

class Card
  attr_accessor :suit, :rank
  def initialize (s, r)
    @suit = s
    @rank = r
  end
  def add_point
    if @rank == 'Ace'
      if true
        11 
      end
    elsif @rank.class == String
      10
    else
      self.rank
    end
  end
end

class Table 
  attr_accessor :cards
  def initialize (s)
    @shoe = s
    @cards = Array.new
  end
  def deal
    self.cards << @shoe.cards.pop
    puts "card number ##{self.cards.size}: '#{self.cards.last.rank}', add #{self.cards.last.add_point}.."
  end
  def sum
    sum = 0
    ace_here = false
    self.cards.each do |card|
      sum += card.add_point
      ace_here = true if card.rank == 'Ace'
    end
    if sum > 21 && ace_here
      sum - 10
    else
      sum
    end
  end
end

class Player
  attr_accessor :points, :table
  def initialize (s)
    @table = Table.new(s)
  end
  def start
    print '***'
    puts self.class == Dealer ? 'dealer start' : 'guest start'
    2.times do
      self.table.deal
      self.status
    end
  end
  def status
    self.points = self.table.sum
    puts "now it's #{self.points}"
    if self.points > 21
      puts "* Busted!" 
      puts "game ends here"
      exit
    elsif self.points == 21
      puts "* Black Jack!"
      puts "game ends here"
      exit
    end
    puts
  end
end

class Dealer < Player
  def ask question
    puts question
  end
end
class Guest < Player
  def answer
    gets.chomp
  end
end

shoe = Shoe.new(2)
shoe.fill!
shoe.cards.shuffle!
me = Guest.new(shoe)
dee = Dealer.new(shoe)
me.start
dee.start
while me.points < 21
  dee.ask "you #{me.points} (vs) dealer #{dee.points}.\nhit (1) or stay (2) ?"
  hit_or_stay = me.answer
  while !(hit_or_stay == '1' || hit_or_stay == '2')
    dee.ask "sorry I couldn't hear you, hit (1) or stay (2) ?"
    hit_or_stay = me.answer
  end
  if hit_or_stay == '1'
    me.table.deal
    me.status
  else
    puts "you stay\n"
    break
  end
end
if dee.points > 17
  puts 'dealer stay'
else
  puts 'dealer hit'
  dee.table.deal
end
dee.status

class Game
  def initialize(d,g)
    @d = d
    @g = g
  end
  def compare
    puts 'Draw' if @d.points == @g.points
    puts 'Lose' if @d.points > @g.points
    puts 'Win' if @d.points < @g.points
  end
end

game = Game.new(dee, me)
game.compare