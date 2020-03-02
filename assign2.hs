-- Roslyn Parker
-- 2 March 2020
-- Programming Languages
import Data.Char
import Data.List
import Data.Function

-- 1
-- recursive definition of countValue
-- returns the number of times a value appears in a list
-- ex: countValue 2 [1,2,7,2,3,8,2,4] should return 3

countValue :: Eq a => a -> [a] -> Int
countValue v [] = 0 -- if the list is empty return 0
countValue v (l:r) -- otherwise 
    | v == l    = 1 + countValue v r
    | otherwise = countValue v r
-- if the element l is equal to the value v output 1 + countValue v r
 -- else look at the rest of the list

-- 2
-- wordFreq: word frequency
-- computes the number of times each 
-- word appears in a text string
-- two words are the same if they have the same letters 
-- regardless of capitalization
-- returns a map of the word and its frequency
wordFreq :: String -> [(String, Int)]
wordFreq s = map (\x -> (head x, length x)) $ group $ sort $ words ([toLower loweredS | loweredS <- s])
-- make sure to convert the string toLower so that all the words
-- that are the same regarless of capitalization go in the same bucket

-- 3
-- build upon 2
-- take the n most common words in a string
wordFreqN :: Int -> String -> [(String, Int)]
wordFreqN 0 s = []
wordFreqN n s = take n (reverse (sortBy (compare `on` snd) (wordFreq s)))
-- sort the values from most frequency to least
-- then take the n amount requested


-- 4
-- applyWhile repeatedly applies a function to a starting value
-- until another function returns false about the result
-- returning the result that violated the while function
applyWhile :: (a -> Bool) -> a -> (a -> a) -> a
applyWhile o x s
    | o x = x
    | otherwise = applyWhile o (s x) s
-- if start s fits with the condition o
-- then applyWhile o (apply c to s) c
-- else output s (the place where it fails)