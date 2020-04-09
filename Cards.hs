-----------------------------------------------------------------------
-- |
-- Module      :  Example.Cards
-- Copyright   :  (c) Craig A. Damon, 2017
--
-- Simple Card and Deck type.
--
-----------------------------------------------------------------------
module Example.Cards
(
  Suit(..)
 ,Rank(..)
 ,Card(..)
 ,Deck()
 ,shuffle
 ,draw
 ,isEmpty
 ,fullDeck
)
where

import System.Random

-- | Suit enum for card suits
data Suit = Clubs | Diamonds | Hearts | Spades
          deriving (Show, Read, Eq, Ord, Bounded, Enum)

-- | Ranks for card ranks
data Rank = Ace | Two | Three | Four | Five | Six |
            Seven | Eight | Nine | Ten | Jack | Queen | King
          deriving (Show, Read, Eq, Ord, Bounded, Enum)
    
-- | Simple playing card (suit and rank)
data Card = Card{getRank::Rank,getSuit::Suit}
        deriving (Eq,Ord,Bounded)

-- | A little cleaner show that the default
instance Show Card where
    show (Card r s) = (show r)++" of "++(show s)
 
-- | Deck is just a wrapper around a list of cards
newtype Deck = Deck [Card]

-- | Simple show just says how full the deck is
instance Show Deck where
    show (Deck cards) = "Deck of " ++ (show (length cards))++" cards"


-- | helper function to sort from one list to another
-- the first list is the source
-- the second list is the destination
shuffler :: (Ord a,RandomGen r) =>  r -> [a] -> [a] -> [a]
shuffler _ [] sh = sh
shuffler r (x:xs) [] = shuffler r xs [x]
shuffler r (x:xs) sh = 
      let (spl,r') = randomR (0,length sh) r in
         let (st,end) = splitAt spl sh in
            shuffler r' xs (st++x:end)


-- | shuffle the cards in a deck using the random gen given
shuffle :: RandomGen r => r -> Deck -> Deck
shuffle rand (Deck cards) = Deck $ shuffler rand cards []


-- | draw a card from the deck, 
-- returning the card and the reduced deck
-- throws an exception if Deck is empty
draw :: Deck -> (Card,Deck)
draw (Deck cards) = (head cards,Deck (tail cards))

-- | is the deck empty
isEmpty :: Deck -> Bool
isEmpty (Deck []) = True
isEmpty _ = False

-- | create a full deck of cards 
fullDeck :: Deck
fullDeck = Deck [Card r s | s <- [Clubs .. Spades],
                            r <- [Ace .. King]]