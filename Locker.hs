-- Roslyn Parker
-- Programming Languages
-- 13 April 2020
module Example.Locker 
(Locker, unlock, lock)
where

import Control.Monad
import Data.Maybe
import Data.Functor

data Locker a = Locker { key :: Int
                     , value :: a}

instance Show (Locker a) where
    show locker = "*SECRET*"

instance Functor Locker where
     fmap f Locker {key = k, value = v} = Locker {key = k, value = f v}

-- lock takes a key and a value
-- returns a Locker
lock :: Int -> a -> Locker a
lock k v = Locker {key = k, value = v}

-- unlock returns the value only if the key matches
-- returns Nothing if the key doesn't match
-- returns Just value if the key matches
unlock :: Int -> Locker a -> Maybe a
unlock k l = if key l == k then Just (value l) else Nothing
