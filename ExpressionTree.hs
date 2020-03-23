--------------------------
-- Module : Example.ExpressionTree
-- Author : Roslyn Parker
-- Date   : 23 March 2020
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
(tree
,empty
,elemOf
,fromList
,toList
,printTree
,evaluate
,show
)
where

-- kind *->* meaning that its type of value is not fixed
-- an instance of ExpressionTree should be either a 
-- value or an operation node
