-- Roslyn Parker
-- 9 April 2020

import System.Directory
import System.IO
import Data.Map as Map
import Data.Time as Time

main :: IO ()
main = do 
    path <- getLine
    if path == ""
        then return()
        else do 
            putStrLn $ listFiles path

listFiles ::  String -> String
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


                    

