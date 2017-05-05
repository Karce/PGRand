-- Copyright 2017 Keaton Bruce
--
-- This file is part of PGRand.
--
-- PGRand is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- PGRand is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with PGRand. If not, see <http://www.gnu.org/licenses/>.
--

#!/usr/bin/env stack
-- stack --install-ghc --resolver lts-5.13 runghc --package http-client-tls
import System.Environment
import Network.HTTP.Client
import Network.HTTP.Client.TLS   (tlsManagerSettings)
import Network.HTTP.Types.Status (statusCode)
import qualified Data.ByteString.Lazy.Char8 as C

main :: IO ()
main = do
    args <- getArgs
    let passChars = show (read (head args) :: Int)
    manager <- newManager tlsManagerSettings
    request <- parseRequest ("https://www.random.org/integers/?num=" ++ 
        passChars ++ "&min=1&max=69&col=1&base=10&format=plain&rnd=new" :: String)
    
    response <- httpLbs request manager
    Prelude.putStrLn $ "The status code was: " ++ 
        show (statusCode $ responseStatus response)
    
    print $ map encode $ map (read::String->Int) $
        init (map C.unpack (C.split '\n' (responseBody response)))

encode :: Int -> Char
encode 1 = 'a'
encode 2 = 'b'
encode 3 = 'c'
encode 4 = 'd'
encode 5 = 'e'
encode 6 = 'f'
encode 7 = 'g'
encode 8 = 'h'
encode 9 = 'i'
encode 10 = 'j'
encode 11 = 'k'
encode 12 = 'l'
encode 13 = 'm'
encode 14 = 'n'
encode 15 = 'o'
encode 16 = 'p'
encode 17 = 'q'
encode 18 = 'r'
encode 19 = 's'
encode 20 = 't'
encode 21 = 'u'
encode 22 = 'v'
encode 23 = 'w'
encode 24 = 'x'
encode 25 = 'y'
encode 26 = 'z'
encode 27 = 'A'
encode 28 = 'B'
encode 29 = 'C'
encode 30 = 'D'
encode 31 = 'E'
encode 32 = 'F'
encode 33 = 'G'
encode 34 = 'H'
encode 35 = 'I'
encode 36 = 'J'
encode 37 = 'K'
encode 38 = 'L'
encode 39 = 'M'
encode 40 = 'N'
encode 41 = 'O'
encode 42 = 'P'
encode 43 = 'Q'
encode 44 = 'R'
encode 45 = 'S'
encode 46 = 'T'
encode 47 = 'U'
encode 48 = 'V'
encode 49 = 'W'
encode 50 = 'X'
encode 51 = 'Y'
encode 52 = 'Z'
encode 53 = '0'
encode 54 = '1'
encode 55 = '2'
encode 56 = '3'
encode 57 = '4'
encode 58 = '5'
encode 59 = '6'
encode 60 = '7'
encode 61 = '8'
encode 62 = '9'
encode 63 = '?'
encode 64 = '!'
encode 65 = '@'
encode 66 = '#'
encode 67 = '$'
encode 68 = '%'
encode 69 = '&'
