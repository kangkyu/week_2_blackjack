This is Object Oriented Ruby Programming Exercise
with Black Jack (week_2 of gotealeaf.com)

```sh
$ cd ~/tealeaf/ruby_projects/week_two_blackjack
$ ruby bin/blackjack
```

+ Both dealer and player receive two cards in the beginning.
+ Dealer's first card is hidden to player.
+ Player receives cards one by one, by decision.
  + (if first two cards are Aces, double down - not implemented)
  + if face value total equals 21 (blackjack) with first two cards, round's over. Player wins.
  + if face value total exceeds 21 (bust) any time while receiving more cards, round's over. Player loses (busts).
  + if player decides not to receive more cards (stay) while face value total less than or equal to 21, the player turn's over.
