/*Begin Question 3.1*/

extract(0, [H|_], H).
extract(A, [_|T], X)
	:- A1 is A-1,
    extract(A1, T, X).

extractAll([], _, []).
extractAll([H|T], Y, [A|R])
	:- extract(H, Y, A),
    extractAll(T, Y, R).
    
indices( IS, XS, ES )
 	:- extractAll(IS, XS, ES). 

/*End Question 3.1*/

/*Begin Question 3.2*/

possible( GRID )
	:- permutation([1,2,3,4,5,6,7,8,9], GRID).

/*End Question 3.2*/

/*Begin Question 3.3*/

sumOf([], 0).
sumOf([H|T], R)
	:- sumOf(T, X),
	R is H + X.

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- indices([0,1,3,4], GRID,TLWC), sumOf(TLWC, T0),
	indices([1,2,4,5], GRID,TRWC), sumOf(TRWC, T1),
	indices([3,4,6,7], GRID,BLWC), sumOf(BLWC, T2),
	indices([4,5,7,8], GRID,BRWC), sumOf(BRWC, T3),
	indices(US, GRID, C1), sumOf(C1, U),
	indices(VS, GRID, C2), sumOf(C2, V),
	indices(WS, GRID, C3), sumOf(C3, W).

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- possible(GRID),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/

-- any main predicates for testing goes here
main
	:- suko( 15, 14, 26, 23
, [0,1,2,3], 16
, [4,6,7], 17
, [5,8], 12
, GRID ),
    write(GRID).
