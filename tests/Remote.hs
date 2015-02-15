module Main where

import           Control.Applicative
import           Data.List           (isSuffixOf)
import           Lib
import           System.Directory    (getDirectoryContents)
import           Test.Framework

main :: IO ()
main = do
  files <- filter (not . isLocal) . filter (".json" `isSuffixOf`)
             <$> getDirectoryContents dir
  ts <- readSchemaTests dir files
  defaultMain (toTest <$> ts)

  where
    dir :: String
    dir = "JSON-Schema-Test-Suite/tests/draft4"