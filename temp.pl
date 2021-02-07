/*
Name: Deepak Singh Baghel
Rollno: 203050005
*/
% I have written all the codes on my own.

% Test List contains at least one occurrence of element X.
once(X, [X|Rest]).
once(X, [Y|Rest]):-once(X, Rest).

% Test List contains at least two occurrence of element X.
twice(X, [X|Rest]):- once(X, Rest).
twice(X, [Y|Rest]):- twice(X, Rest).

% Test the binary representation of bits in List equals to A.
isBinEqual([], A, A).
isBinEqual([B|Rest], X, A):-
	Z is X * 2 + B, isBinEqual(Rest, Z, A).
binvalue(List, A):-
	isBinEqual(List, 0, A).

% List all factors of N

get_factor(N, I, R, [I|R]):-
	0 is N mod I.
get_factor(N, I, R, R):-
	\+ 0 is N mod I.

find_factors(N, 0, R, R).
find_factors(N, I, R, Ans):-
	get_factor(N, I, R, NewR),
	I1 is I - 1,
	find_factors(N, I1, NewR, Ans).
factors(N, Ans):-
	N >= 1, find_factors(N, N, [], Ans).


% Generate all prime factors of N.
/*
prime_factor(N, D) :-
    find_prime_factor(N, 2, D).

find_prime_factor(N, D, D) :-
    0 is N mod D.
find_prime_factor(N, D, R) :-
    D < N,
    (0 is N mod D
    -> (N1 is N/D, find_prime_factor(N1, D, R))
    ;  (D1 is D + 1, find_prime_factor(N, D1, R))
    ).
*/


% Print the factors of N by iterating from 1 to N.
/*
print_fact(N, I):-
	I is N+1.
print_fact(N, I):-
	divides(N, I),write(I),write(", "), I1 is I+1, print_fact(N, I1); I1 is I+1, print_fact(N, I1).
print_fact(N):-
	N >= 1, print_fact(N, 1).
*/

/*
divides(N, X):-
	0 is N mod X.
factor(N, [X|Rest]):-
	X > 0, divides(N, X), factor(N, Rest).
*/



% print the factors of N.
/*
divides(N,D) :-
    0 is N mod D.

divisors_0(N,D,R0,[D|R0]) :-
    divides(N,D).

divisors_0(N,D,R0,R0) :-
    \+ divides(N,D).

divisors(_,0,R,R).

divisors(N,D0,R0,R) :-
    divisors_0(N,D0,R0,R1),
    D is D0 - 1,
    divisors(N,D,R1,R).

divisors(X,R) :-
    X > 1,
    divisors(X,X,[],R), !.

*/