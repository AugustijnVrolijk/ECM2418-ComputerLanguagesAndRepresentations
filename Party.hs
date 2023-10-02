-- any imports go here

{-Begin Question 1.1-}

digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

{-End Question 1.1-}

{-Begin Question 1.2-}

checkUniqueDigits :: [Int] -> Bool
checkUniqueDigits [] = True
checkUniqueDigits (x:xs) 
  | memberSet x xs == True = False
  | otherwise = checkUniqueDigits xs

memberSet :: Int -> [Int] -> Bool
memberSet e [] = False
memberSet e (x:xs) 
  | e == x = True
  | otherwise = memberSet e xs

isPar :: Int -> Bool
isPar x
  | checkUniqueDigits (digits x) == True
  && p `mod` q == 0 && memberSet 0 (digits x) == False = True
  | otherwise = False
  where p = x `mod` 100 
        q = x `div` 100

pars :: [Int]
pars = filter isPar [1000..4999]

{-End Question 1.2-}

{-Begin Question 1.3-}

isParty :: (Int, Int) -> Bool
isParty (x, a)
  | checkUniqueDigits (digits x ++ digits a) == True && x `mod` q == 0 && a `mod` q == 0 = True
  | otherwise = False
  where q = findMissingDigit [1.. 9] (digits x ++ digits a)

possiblePartys :: [Int] -> [Int] -> [(Int, Int)]
possiblePartys [] [] = []
possiblePartys (x:xs) (y:ys) = [(x, y)] ++ possiblePartys xs (y:ys)
possiblePartys [] (y:ys) = possiblePartys ys ys

partys :: [(Int, Int)]
partys = filter isParty x
  where x = possiblePartys pars pars

{-End Question 1.3-}

-- any main functions for testing goes here
