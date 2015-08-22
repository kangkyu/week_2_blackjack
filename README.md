### Blackjack in Ruby

This is a command-line app project started as Object-Oriented Ruby Programming Exercise of [Tealeaf Academy](http://gotealeaf.com/) (week 2 of course 1).

```sh
$ bin/blackjack
```

+ Both dealer and player receive two cards in the beginning.
+ Dealer's first card is hidden to player.
+ Player receives cards one by one, by decision (hit).
  + (if first two cards are Aces, double down - not implemented)
  + if face value total equals 21 (blackjack) with first two cards, round's over. Player wins.
  + if face value total exceeds 21 (bust) any time while receiving more cards, round's over. Player loses (busts).
  + if player decides not to receive more cards (stay) while face value total less than or equal to 21, the player turn's over.
