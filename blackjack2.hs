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
    let ([downCard, upCard], newDeck') = drawHand 2 newDeck

    let firstOutput = "Your first card is " ++ show card1
    let secondOutput = "Your second card is " ++ show card2

    let total = totalCard (sumCards (valueCard [card1, card2]))
    let dOutput = "Dealer's up card is " ++ show upCard

    putStrLn firstOutput
    putStrLn secondOutput
    putStrLn dOutput

    hos newDeck' [card1, card2] [downCard, upCard]

    return (0)

-- Hit Or Stand
hos :: Deck -> [Card] -> [Card] -> IO
hos deck cards dcards = do
    let prompt = "Hit or stand?"
    putStrLn prompt
    input <- getLine
    if input == "hit" then do 
        let ([card], newDeck) = drawHand 1 deck
        let output = "Your new card is " ++ show card
        putStrLn output
        hos newDeck cards:card dcards
    else do
        let total = totalCard (sumCards (valueCard cards))
        let poutput = "Your total is " ++ show total
        let outputd = "Dealer's down card is " ++ show (head dcards)
        putStrLn poutput
        putStrLn outputd
        dealerTurn deck cards dcards

dealerTurn :: Deck -> [Card] -> [Card] -> IO
dealerTurn deck cards dcards = do 
            let total = totalCard (sumCards (valueCard dcards))
            if  total < Just 17 then do 
                 let ([dcard], newDeck) = drawHand 1 deck
                 let output = "Dealer draws " ++ show dcard
                 putStrLn output
                 dealerTurn newDeck cards dcards:dcard
            else do 
                if total == Nothing then do 
                    let poutput = "Dealer busts!"
                    putStrLn poutput
                else do
                    let ptotal = totalCard (sumCards (valueCard cards))
                    let doutput = "Dealer wins " ++ show total ++ " to " ++ show ptotal
                    putStrLn doutput

-- Draw a hand of cards for blackjack game
drawHand :: Int -> Deck ->([Card],Deck)
drawHand 0 deck = ([], deck)
drawHand n deck = let (card, newDeck) = draw deck in
                  let (hand, newDeck') = drawHand (n - 1) newDeck in
                  (card:hand, newDeck')

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