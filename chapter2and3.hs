-- Roslyn Parker
-- 29 Jan. 2020

succ 8 --successor of a number or letter(alphabetical); out 9 
min 9 10 --min between two numbers; out 9
max 9 10 --max between two numbers; out 10 

succ 9 + max 4 5 + 1 --out 10 + 5 + 1 = 16

div 100 10 --division; divides 100 by 10; out 10

--functions
doubleMe x = x + x
doubleMe 5 --out 10

doubleUs x y = doubleMe x + doubleMe y 
doubleUs 2 4 --out 12

doubleSmallNum x = if x > 100
					then x
					else x*2
					
reverse [1, 2, 3, 4, 5] --out [5, 4, 3, 2, 1]

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
removeNonUppercase "Hahaha! Ahahaha!" --out "HA"

--ranges
[1..20] --out [1,2, 3, 4, 5, 6, 7, 8, 9, 10,..., 20]
['a'..'g'] --out "abcdefg"
[1, 3..11] --out [1, 3, 5, 7, 9]
	
[x*2 | x <- [1..10]] --out [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

let nouns = ["park", "cat"]

-- a tuples is a set of values that forms a single values
-- seperated by commas and wrapped in parenthesis
-- (1, 2) kind of like coordinates, vectors, and more...
-- you can have a tuples of tuples

fst (8, 11) --out 8; takes the first component
snd (8, 11) --out 11; takes the second component

-- use ':t any_type' to see what type it is
-- ex: :t 'a' outputs 'a' : Char
-- :: means "has a type of"

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Vairables types: 
	--Int, Integer, Float, Double, Bool, Char
	-- Tuples (var,var),()

-- :t head outputs head :: [a] -> a
-- [a] is an array of any type

-- Eq is used for types that support equality testing
-- ex: ==, /=
-- returns True or False

-- Ord is for types that have an ordering
-- standard comparing functions such as >, <, >=, <=

-- show takes in any type is presents it as a string
show 3 --out "3"

-- read is sort of like the opposit of show
-- it takes any string and returns a type that is a member or read
read "8.2" + 1.8 --out 10
read "5" :: Int -- reads the string 5 as an integer

-- use minBound and maxBound to find the min and max bounds of
-- a specific type

-- Num is a numeric typeclass that has members that are able
-- to act like numbers

-- Inetgral is a numeric typeclass, includes only whole numbers
-- Floating includes only floating point numbers such as Float and Double




