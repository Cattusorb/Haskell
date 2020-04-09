--------------------------
-- Module : Example.ExpressionTree
-- Author : Roslyn Parker
-- Date   : 9 April 2020
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

module Example.ExpressionTree
(ExprTree, evaluateTree, showTree) where

-- Data Constructor for an Expression Tree
data ExprTree = Value Int | Op String (ExprTree)(ExprTree)

instance Show ExprTree where
    show (Value a) = show a
    show (Op o l r) = case o of 
                "*" -> o ++ " " ++ show l ++ " " ++ show r
                "+" -> o ++ " " ++ show l ++ " " ++ show r
                "-" -> o ++ " " ++ show l ++ " " ++ show r

-- Evaulates an Expression Tree
evaluateTree :: ExprTree -> Int
evaluateTree (Value x) = x
evaluateTree (Op o l r) = case o of 
                "*" -> evaluateTree l * evaluateTree r
                "+" -> evaluateTree l + evaluateTree r 
                "-" -> evaluateTree l - evaluateTree r


