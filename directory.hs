-- Roslyn Parker
-- 26 March 2020

import System.IO.Error
import System.Directory
import System.Environment

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

listFiles :: String -> IO
listFiles (dir:xs) = let files = listDirectory dir
                     if isDirectory dir
                     then listDirectory dir
                     else print "Error: directory not found"
                    

