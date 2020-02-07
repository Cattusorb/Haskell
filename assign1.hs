-- Roslyn Parker
-- Programming Languages
-- 10 February 2020

-- Define a basicMath function
-- Returns a tuple with the sum, difference, product, and quotient
basicMath :: Float -> Float -> (Float,Float,Float,Float)
basicMath a b = (a + b, a - b, a * b, a / b)

-- Define factors function
-- Returns a list of all factors of the given number
factors :: Int -> [Int..]
factors n
    | n > 0 = 0 

-- Define compute functions
-- Takes a tuple with an operator and 2 numbers ('+', 1)
-- Returns the value from computing with the given operator
compute :: (Char, Float) -> Float
compute (op, n)

-- Define a function corn
-- Takes the number of ears of corn a customer wants to buy
-- Returns the total price
corn :: Int -> Float
corn n