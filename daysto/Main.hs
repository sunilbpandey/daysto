module Main where

import Data.Time.Calendar ( Day, diffDays )
import Data.Time.Clock ( getCurrentTime )
import Data.Time.LocalTime ( LocalTime(localDay), utcToLocalTime, getCurrentTimeZone )
import Data.Time.Format ( defaultTimeLocale, parseTimeM )
import System.Environment ( getArgs )

getCurrentLocalTime :: IO LocalTime
getCurrentLocalTime = utcToLocalTime <$> getCurrentTimeZone <*> getCurrentTime

parseDate :: String -> Maybe Day
parseDate = parseTimeM True defaultTimeLocale "%Y-%m-%d"

daysTo :: Maybe Day -> Maybe Day -> String
daysTo (Just to) (Just from) = show (diffDays to from)
daysTo _ _ = ""

exec :: Day -> [String] -> String
exec today args = case args of
    []        -> ""
    [to]      -> daysTo (parseDate to) (Just today)
    from:to:_ -> daysTo (parseDate to) (parseDate from)

main :: IO ()
main = do
    today <- getCurrentLocalTime
    getArgs >>= putStrLn . exec (localDay today)
