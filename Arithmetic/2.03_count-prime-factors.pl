% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

% count_prime_factor():- will count the power of prime factor.
count_prime_factor(N, P, I, I) :-
    N mod P =\= 0.
count_prime_factor(N, P, I, C) :-
    N mod P =:= 0,
    N1 is N // P,
    I1 is I + 1,
    count_prime_factor(N1, P, I1, C).


% list_prime_factor():- will make list of all prime factor and power.
list_prime_factor(N, _, []) :- N =:= 1.
list_prime_factor(N, P, Tail) :-
    N > 1,
    N mod P =\= 0,
    next_prime(P, P2),
    list_prime_factor(N, P2, Tail).
list_prime_factor(N, P, [[P, C]|Tail]) :-
    N > 1,
    next_prime(P, P2),
    (   N mod P =:= 0 ->
        count_prime_factor(N, P, 0, C),
        N1 is N // (P^C),
        list_prime_factor(N1, P2, Tail)
    ).


prime_fac_multiplicity(N, []) :- N < 2, !.
prime_fac_multiplicity(N, Factors) :-
    integer(N),
    N >= 2,
    list_prime_factor(N, 2, Factors).


% ################### utility #################################

is_prime(N, I) :-
    (   I * I > N
    ;   N mod I =\= 0,
        I1 is I + 2,
        is_prime(N, I1)
    ).
is_prime(2).
is_prime(N) :-
    integer(N),
    N > 2,
    N mod 2 =\= 0,
    is_prime(N, 3).

next_prime(2, 3).
next_prime(P1, P2) :-
    I is P1 + 2,
    (   is_prime(I),
        P2 is I
    ;   next_prime(I, P2)
    ).














