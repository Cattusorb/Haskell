--------------------------
-- Module : Example.ExpressionTree
-- Author : Roslyn Parker
-- Date   : 26 March 2020
--
-- An expression tree in binary tree format
-- ex:  3 * (4 + 5) turns into : 
-- 
--      * 
--     / \
--    3   +
--       / \
--      4   5 
--------------------------

data OpNode = Add
            | Sub
            | Mul

data ExprTree = Value Integer | Compute OpNode ExprTree ExprTree

-- evaluate 
evaluateTree :: ExprTree -> Integer
evaluateTree (Value x) = x
evaluateTree (Compute Add l r) = evaluateTree l  + evaluateTree r
evaluateTree (Compute Sub l r) = evaluateTree l  - evaluateTree r
evaluateTree (Compute Mul l r) = evaluateTree l  * evaluateTree r

-- show
showTree :: ExprTree -> String
showTree (Value x) = show x
showTree (Compute Add l r) = showTree l ++ " + " ++ showTree r
showTree (Compute Sub l r) = showTree l ++ " - " ++ showTree r
showTree (Compute Mul l r) = showTree l ++ " * " ++ showTree r

-- kind *->* meaning that its type of value is not fixed
-- an instance of ExpressionTree should be either a 
-- value or an operation node
