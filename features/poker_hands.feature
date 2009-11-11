Feature: Poker Hands
  In order to decide a winner for the prize
  As a poker player
  I want to rank poker hands according to poker rules:
  
  """
  A poker deck contains 52 cards - each card has a suit which is one of clubs,
  diamonds, hearts, or spades (denoted C, D, H, and S in the input data). Each card
  also has a value which is one of 2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace
  (denoted 2, 3, 4, 5, 6, 7, 8, 9, T, J, Q, K, A). For scoring purposes, the suits are
  unordered while the values are ordered as given above, with 2 being the lowest and
  ace the highest value. A poker hand consists of 5 cards dealt from the deck.
  """

  Scenario Outline: <Black Hand> <Versus> <White Hand>
    Given a black hand with cards "<Black Cards>"
      And a white hand with cards "<White Cards>"
     Then black <Versus> against white

  Examples:
    | Black Hand      | Black Cards    | Versus | White Hand      | White Cards    | Note                            |
    | Straight Flush  | 2H 3H 4H 5H 6H | wins   | Four of a Kind  | AC AH AD AS KC |                                 |
    | Straight Flush  | 2H 3H 4H 5H 6H | ties   | Straight Flush  | 2C 3C 4C 5C 6C |                                 |
    | Straight Flush  | 2C 3C 4C 5C 6C | loses  | Straight Flush  | 7H 3H 4H 5H 6H | ranked by highest card          |
    | Four of a Kind  | 2C 2H 2D 2S AC | wins   | Full House      | AC AH AD KS KC |                                 |
    | Four of a Kind  | JC JH JD JS QC | loses  | Four of a Kind  | KC KH KD KS AC | ranked by value of 4 cards      |
    | Full House      | 2C 2H 2S 3C 3S | wins   | Flush           | 4C 8C TC KC AC |                                 |
    | Full House      | 3C 3H 3D AH AC | loses  | Full House      | 4C 4D 4H 2C 2S | ranked by value of 3 cards      |
    | Flush           | 2S 3S 4S 5S 7S | wins   | Straight        | TH JC QS KC AC |                                 |
    | Flush           | 4C 8C JC QC KC | ties   | Flush           | 4S 8S JS QS KS |                                 |
    | Flush           | 2S 8S JS QS KS | loses  | Flush           | 4C 8C JC QC KC | ranked by rules of Highest Card |
    | Straight        | 2H 3C 4S 5C 6C | wins   | Three of a Kind | AH AC AD KC QH |                                 |
    | Straight        | TH JC QS KC AC | ties   | Straight        | TC JD QH KD AD |                                 |
    | Straight        | TH JC QS KC 9C | loses  | Straight        | TC JD QH KD AC | ranked by highest card          |
    | Three of a Kind | 2S 2C 2H 3S 4C | wins   | Two Pairs       | AH AC KC KH QS |                                 |
    | Three of a Kind | AH KC 3C 3D 3H | loses  | Three of a Kind | 4C 4H 4S 3S 2C | ranked by value of 3 cards      |
    | Two Pairs       | 2S 2C 3H 3D 4S | wins   | Pair            | AH AC KC QH JS |                                 |
    | Two Pairs       | AH AC KC KH QS | ties   | Two Pairs       | AS AD QH KD KS |                                 |
    | Two Pairs       | AS KD QH QD KS | loses  | Two Pairs       | AH AC KC KH QS | 1st ranked by highest pair      |
    | Two Pairs       | AH AC KC KH QS | wins   | Two Pairs       | AS AD QH QD KS | 2nd ranked by lowest pair       |
    | Two Pairs       | AS AD JH KD KS | loses  | Two Pairs       | AH AC KC KH QS | 3rd ranked by highest card      |
    | Pair            | 2H 2C 3S 4C 6H | wins   | Highest Card    | AH KC QS 7D 9S |                                 |
    | Pair            | AH AC KC QH JS | ties   | Pair            | AS AD JC QC KS |                                 |
    | Pair            | KD AD JC QH KS | loses  | Pair            | AH AC KC QD JS | 1st ranked by value of 2 cards  |
    | Pair            | AH AC KC QC JS | wins   | Pair            | AS AD TC QH KS | 2nd ranked by highest card      |
    | Highest Card    | 2H 4D 5S 9C KD | ties   | Highest Card    | 2D 4H 5C 9S KH |                                 |
    | Highest Card    | 2H 4D 5S 9C KD | loses  | Highest Card    | 2C 4H 5C 9S AH | 1st ranked by highest card      |
    | Highest Card    | 2H 4D 5S 9C AD | loses  | Highest Card    | 2C 4H 5C TS AH | then ranked by second highest   |
    | Highest Card    | 2H 4D 5S TC AD | loses  | Highest Card    | 2C 4H 6C TS AH | and so on...                    |
    | Highest Card    | 2H 4D 6S TC AD | loses  | Highest Card    | 2C 5H 6C TS AH |                                 |
    | Highest Card    | 2H 5D 6S TC AD | loses  | Highest Card    | 3C 5H 6C TS AH |                                 |
    