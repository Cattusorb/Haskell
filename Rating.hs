-- Roslyn Parker
-- 23 March 2020

data Rating = One | Two | Three | Four | Five

instance Show Rating where
    show One   = "*"
    show Two   = "**"
    show Three = "***"
    show Four  = "****"
    show Five  = "*****"

deriving (Ord, Eq, Enum)
