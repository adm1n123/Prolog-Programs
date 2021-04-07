% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

% testing prime number using only one predicate O(sqrt(N)).

is_prime(N, I) :-
    I*I >= N; N mod I =\= 0, I1 is I+2, is_prime(N, I1).
is_prime(2).
is_prime(N) :-
    integer(N), N > 2, N mod 2 =\= 0, is_prime(N, 3).

