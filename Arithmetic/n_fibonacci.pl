% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

% print first N fibonacci.

list_fib(0, _, _, []).
list_fib(N, X, Y, [Y|Fiblist]) :-
    N > 0, Z is X + Y, N1 is N - 1, list_fib(N1, Y, Z, Fiblist).

list_n_fib(0, []).
list_n_fib(N, Fiblist) :-
    N > 0, list_fib(N, 0, 1, Fiblist).
