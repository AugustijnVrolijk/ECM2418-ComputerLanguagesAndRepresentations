/*Begin Question 4.1*/

prime( N ) 
	:- integer(N),
    N > 1,
    prime(N,2).
prime(X,Y) 
	:- Y =:= X,
    true.
prime(X,Y) :-
    0 =\= X mod Y,
    prime(X,Y+1).

/*End Question 4.1*/

/*Begin Question 4.2*/

possible(X, Y, Z)
	:- between(123,179,X), /*begin at 123 as 0 is not a valid integer solution & no duplicate integers allowed*/
    between(234,269,Y), /*begin at 234 as 1 will for certain be used in X*/
    between(345,359,Z). /*begin at 345 as 1 and 2 will for certain be used in X and Y*/

/*End Question 4.2*/

/*Begin Question 4.3*/

acceptable( X, Y, Z) 
 	:- X < 359, Y < 359, Z < 359,
    name(X, [X1,X2,X3]),
    name(Y, [X4,X5,X6]),
    name(Z, [X7,X8,X9]),
    is_set([X1,X2,X3,X4,X5,X6,X7,X8,X9]), /*ensuring no duplicates*/
    name(0, [X0]),
    \+ member(X0,[X1,X2,X3,X4,X5,X6,X7,X8,X9]), /*ensuring only integers 1-9 are used (i.e. not 0)*/
    \+ prime(X), \+ prime(Y),\+ prime(Z).

trait( X, Y, Z )
	:- possible(X, Y, Z),
    acceptable( X, Y, Z).

/*End Question 4.3*/

main
    :- trait(X, Y, Z), write(X), write(" "), write(Y), write(" "), write(Z), write("    ").
