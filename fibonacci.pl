% author: Deepak Singh Baghel mail: deepakbaghel@cse.iitb.ac.in

% list_fibonacci(N, List). listing all fibinacci =< N. NOTE: it is not
% first N finonacci.

check_fibonacci(N, X, Y) :-
    Z is X + Y, Z =< N, (N =:= Z; check_fibonacci(N, Y, Z)).

is_fibonacci(1).
is_fibonacci(N) :-
    integer(N), N > 1, check_fibonacci(N, 1, 1).


% print fibonacci till N.
list_fib(N, I, []) :-
    I > N.
list_fib(N, I, [I|Fiblist]) :-
    I =< N, is_fibonacci(I), I1 is I + 1, list_fib(N, I1, Fiblist).
list_fib(N, I, Fiblist) :-
    I =< N, \+ is_fibonacci(I), I1 is I + 1, list_fib(N, I1, Fiblist).

list_fibonacci(0, []).
list_fibonacci(N, [1|Fiblist]) :-
    integer(N), N > 0, list_fib(N, 1, Fiblist).
