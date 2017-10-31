module Main where

main :: IO ()
main = do
  putStrLn "hello world"

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

isPrime :: Integer -> Bool
isPrime 1 = True
