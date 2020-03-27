-- Roslyn Parker
-- 28 March 2020

import System.Directory
import System.IO
import Data.Map
import Data.Time

-- preforms a recursive Is
-- lists one file / directory per line

-- if a file is a directory, it should just list the name 
-- and then list each contained file on a new line,
-- indented by 4 additional spaces from the current indent

-- for each file, indicate if the file is an executable, 
-- the size of the file, the last modification date 

-- should take a path as its one argument or "." for the 
-- current directory

-- starting point with no indent
-- give error if the path doesn't exist

-- use catch to catch an IO error

listFiles ::  String -> IO [FilePath]
listFiles dir = if boolFromIO (doesDirectoryExist dir)
                then listDirectory dir
                else error "Error: Directory doesn't exist"

showDetail :: String -> (IO Integer, IO UTCTime, IO Bool)
showDetail file = (getFileSize file, getModificationTime file, doesDirectoryExist file)

boolFromIO :: IO Bool -> Bool
boolFromIO = boolFromIO

--getModificationTime
--getFileSize
--doesDirectoryExist 

-- ex: 
-- Hello
--     File.txt
--     File.exe
-- World
--     Hi
--         File.exe
--         File.txt
--     Hey


                    

