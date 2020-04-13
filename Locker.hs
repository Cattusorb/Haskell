-- Roslyn Parker
-- Programming Languages
-- 8 April 2020
module Example.Locker 
(Locker, unlock, lock)
where

import Control.Monad
import Data.Maybe
import Data.Functor

data Locker = Locker { key :: Maybe Int
                     , value :: Maybe Int}

instance Show Locker where
    show locker = "*SECRET*"

instance Functor Locker where
     fmap f l = Locker {key = key l, value = f (value l)}

-- lock takes a key and a value
-- returns a Locker
lock :: Int -> Int -> Locker
lock k v = Locker {key = Just k, value = Just v}

-- unlock returns the value only if the key matches
-- returns Nothing if the key doesn't match
-- returns Just value if the key matches
unlock :: Maybe Int -> Locker -> Maybe Int
unlock k l = if key l == k then value l else Nothing
