-- Roslyn Parker
-- Programming Languages
-- 29 April 2020

import Example.Cards
import Data.List
import System.Random

main = do 
    putStrLn "How many cards?"
    cardCount <- getLine
    gen <- newStdGen 
    let deck = shuffle gen fullDeck
    let (hand, _) = drawHand (read cardCount::Int) deck
    let values = valueCard hand
    let sums = sumCards values
    let total = totalCard sums
    let output = "Hand of " ++ show hand ++ " totals " ++ show total
    putStrLn output
    return (0)

-- Draw a hand of cards for blackjack game
drawHand :: Int -> Deck ->([Card],Deck)
drawHand 0 deck = ([], deck)
drawHand n deck = let (card, newDeck) = draw deck in
                  let (hand, newDeck') = drawHand (n - 1) newDeck in
                  (card:hand, newDeck')

--     add applicative sum (+) <$> list1 <*> list2


-- Finds all values of cards in hand
valueCard :: [Card] -> [[Int]]
valueCard [] = []
valueCard (x:xs) = case getRank x of 
    Ace   -> [1, 11] : valueCard xs
    Two   -> [2] : valueCard xs
    Three -> [3] : valueCard xs
    Four  -> [4] : valueCard xs
    Five  -> [5] : valueCard xs
    Six   -> [6] : valueCard xs
    Seven -> [7] : valueCard xs
    Eight -> [8] : valueCard xs
    Nine  -> [9] : valueCard xs
    Ten   -> [10] : valueCard xs
    Jack  -> [10] : valueCard xs
    Queen -> [10] : valueCard xs
    King  -> [10] : valueCard xs

-- Add up all possible sums for cards
sumCards :: [[Int]] -> [Int]
sumCards [] = []
sumCards values = filter (<22) $ foldr (\l1 l2 -> (+) <$> l1 <*> l2) [0] values 

-- Return the greatest value of card values that is <= 21
-- Otherwise return Nothing if list is empty
totalCard :: [Int] -> Maybe Int
totalCard [] = Nothing
totalCard values = Just (maximum values)