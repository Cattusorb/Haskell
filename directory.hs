-- Roslyn Parker
-- 10 April 2020

import System.Directory
import System.IO
import Data.Map as Map
import Data.Time as Time

-- ex: 
-- Hello
--     File.txt
--     File.exe
-- World
--     Hi
--         File.exe
--         File.txt
--     Hey

main :: IO ()
main = do 
    path <- getLine
    if path == ""
        then return()
        else do 
            listFiles path 0

listFiles :: FilePath -> Int -> IO [FilePath]
listFiles dir i = do 
                   isDir <- doesDirectoryExist dir -- take IO out of box and into just Bool
                   if isDir
                   then do
                       files <- listDirectory dir
                       return files
                   else do 
                       putStrLn "Directory doesn't exist."
                       return ()

showDir dirPath i = do
    putStrLn dirPath
    dir <- listDirectory dirPath
    mapM_ listFiles $ dir

showFile filePath i = do
    size <- getFileSize filePath
    time <- getModificationTime filePath
    putStrLn i ++ filePath ++ " " ++ size ++ " " ++ time