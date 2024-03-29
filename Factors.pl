% List all factors of N  *********************************************
get_factor(N, I, R, [I|R]):-
	0 is N mod I.
get_factor(N, I, R, R):-
	\+ 0 is N mod I.

find_factors(_, 0, R, R). % we should write N in place of underscore but that is singleton variable(never used) where as R seems to be singleton but it is not because R is used to assign value to Ans hence we can not use underscore in place of R.
find_factors(N, I, R, Ans):-
	get_factor(N, I, R, NewR),
	I1 is I - 1,
	find_factors(N, I1, NewR, Ans).
factors(N, Ans):-
	N >= 1, find_factors(N, N, [], Ans).



% List all factors of N THIS IS STACKOVERFLOW CODE DON'T COPY ****************
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



% ******************It will print factors.**************************
print_fact(N, I):-
	I is N+1.
print_fact(N, I):-
	divides(N, I),write(I),write(", "), I1 is I+1, print_fact(N, I1); I1 is I+1, print_fact(N, I1).
print_fact(N):-
	N >= 1, print_fact(N, 1).



% *****************List prime factors with repetition.*****************
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

