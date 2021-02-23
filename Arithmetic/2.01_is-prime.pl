% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

check_prime(N, N).
check_prime(I, N):-
    I < N, 0 =\= N mod I, I1 is I + 1, check_prime(I1, N).

is_prime(N):-
    N > 1, check_prime(2, N).


% check prime in O(sqtr(N)) time complexity.
has_factor(I, N) :-
    I*I =< N, (N mod I =:= 0 ; I1 is I+2, has_factor(I1, N)).

is_prime_fast(2).
is_prime_fast(N) :-
    N > 1,N mod 2 =\= 0, \+ has_factor(3, N).



