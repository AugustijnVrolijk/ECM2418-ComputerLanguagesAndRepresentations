-- any imports go here

{-Begin Question 2.1-}

number :: [Int] -> Int
number [] = 0
number (x:xs) = x*10^length(xs) + number xs

{-End Question 2.1-}

{-Begin Question 2.2-}

Split :: [Int] -> [Int] -> Int -> ([Int],[Int])
Split [b] [x:xs] a
	| x == a = ([bs|x], [xs])
	| otherwise = Split [bs|x] xs a

splits :: [a] -> [([a],[a])]
splits [x] = map (\x -> Split [] x) [x]

possibles :: [([Int],[Int])]

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int],[Int]) -> Bool

acceptables :: [([Int],[Int])]

{-End Question 2.3-}

-- any main functions for testing goes here
