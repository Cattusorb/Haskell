-- Roslyn Parker
-- Programming Languages
-- 8 April 2020
module Example.Locker 
(Locker, unlock, lock)
where

import Control.Monad

data Locker = Key Value

instance Show Locker where
    show locker = "*SECRET*"

--instance Functor Locker where
    

-- lock takes a key and a value
-- returns a Locker
lock :: a -> a -> Locker
lock k v = Locker k v

-- unlock returns the value only if the key matches
-- returns Nothing if the key doesn't match
-- returns Just value if the key matches
unlock :: a -> Locker -> Maybe
unlock k l = if l . Key == k then (show l . Value) else Nothing
