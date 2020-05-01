-- Roslyn Parker
-- Programming Languages
-- 1 May 2020

import Example.Cards
import Data.List
import System.Random

main = do 
    gen <- newStdGen 
    let deck = shuffle gen fullDeck
    let ([card1, card2], newDeck) = drawHand 2 deck
    let ([card], newDeck') = drawHand 1 newDeck

    let firstOutput = "Your first card is " ++ show card1
    let secondOutput = "Your second card is " ++ show card2
    let dOutput = "Dealer's up card is " ++ show card

    putStrLn firstOutput
    putStrLn secondOutput
    putStrLn dOutput

    return (0)

-- Hit Or Stand
hos :: String -> Deck -> ([Card], Deck)

-- Dealer hand check
dealerHand :: Deck -> ([Card], Deck)

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