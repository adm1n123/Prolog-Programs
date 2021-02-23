% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

find_prime_factors(N, N1, F, F) :-
    N1 =:= N + 1.
find_prime_factors(N, I, [I|Faclist], Factors) :-
    I =< N, is_prime(I), N mod I =:= 0, I1 is I + 1, find_prime_factors(N, I1, Faclist, Factors).
find_prime_factors(N, I, Faclist, Factors) :-
    I =< N, \+ (is_prime(I), N mod I =:= 0), I1 is I + 1, find_prime_factors(N, I1, Faclist, Factors).
prime_factors(N, []) :-
    N =< 1.
prime_factors(N, Factors) :-
    find_prime_factors(N, 2, Factors, []).



% ############### This is utility code to test prime.#########################

is_prime(2).
is_prime(3).
is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ has_factor(P,3).

% has_factor(N,L) :- N has an odd factor F >= L.
%    (integer, integer) (+,+)

has_factor(N,L) :- N mod L =:= 0.
has_factor(N,L) :- L * L < N, L2 is L + 2, has_factor(N,L2).
