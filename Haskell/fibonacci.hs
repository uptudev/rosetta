import Data.Word

fibonacci :: Word64 -> Word64 -> IO()
fibonacci a b
    | a + b < b = putStrLn "Overflowed!"
    | otherwise = do 
        let c = a + b
        print c
        fibonacci b c

main :: IO()
main = do
    let a = 0 :: Word64
    print a
    let b = 1 :: Word64
    print b
    fibonacci a b
    
