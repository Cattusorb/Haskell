-- Roslyn Parker
-- Programming Languages
-- 10 February 2020

-- Define a basicMath function
-- Returns a tuple with the sum, difference, product, and quotient
basicMath :: Float -> Float -> (Float,Float,Float,Float)
basicMath a b = (a + b, a - b, a * b, a / b)

-- Define factors function
-- Returns a list of all factors of the given number
factors :: Int -> [Int]
factors n = [a | a <- [1..n], n `mod` a == 0]

-- Define compute functions
-- Takes a tuple with an operator and 2 numbers ('+', 1)
-- Returns the value from computing with the given operator
compute :: (Char, Float, Float) -> Float
compute (op, a, b) = case op of
    '+' -> (a + b)
    '-' -> (a - b)
    '*' -> (a * b)
    '/' -> (a / b)

-- Define a function corn
-- Takes the number of ears of corn a customer wants to buy
-- Returns the total price
corn :: Float -> [Char]
corn n
    | n <= 0 = "$" ++ show 0
    | n < 12 = "$" ++ show (n * 0.5) -- 50 cents per ear
    | n < 24 = "$" ++ show (n * 0.45) -- 45 cents per ear
    | n < 36 = "$" ++ show (n * 0.4) -- 40 cents per ear
    | n >= 36 = "$" ++ show (n * 0.35) -- 35 cents per ear