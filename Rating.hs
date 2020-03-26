-- Roslyn Parker
-- 26 March 2020

data Rating = One | Two | Three | Four | Five
    deriving (Ord, Eq, Enum)
instance Show Rating where
    show One   = "*"
    show Two   = "**"
    show Three = "***"
    show Four  = "****"
    show Five  = "*****"