-- Roslyn Parker
-- 28 February 2020
-- Programming Languages

import Data.List

wordFreq :: String -> [(String, Int)]
wordFreq s = map (\x -> (head x, length x)) $ group $ sort $ words s


wordFreqN :: Int -> String -> [(String, Int)]
wordFreqN n s = take n (wordFreq s)