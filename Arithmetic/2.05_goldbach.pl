% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

goldbach(_, I, R, [I, R]).
goldbach(N, I, Ans) :-
    I < N,
    (   is_prime(I),
        R is N - I,
        is_prime(R),
        goldbach(_, I, R, Ans)
    ;   I1 is I + 2,
        goldbach(N, I1, Ans)
    ).

goldbach(N, _) :-
    N =\= 4,
    (   N < 4 %if this is true then N mod 2=\=0 will be explored next time. if you use 'false' instead of ! (cut).
    ;   N mod 2 =\= 0
    ),
    write('N should be greater than 2 and even'),
    !. % I have added this just to make sure result is true because I have already printed message.
% NOTE; if final value is false so when (N < 4) is true
% then control again go back and check N mod 2=\= 0 and print message
% twice. WHY? This is control flow in prolog if any control flow is
% false then next flow will be explored don't think that it is like
% normal OR condition.

goldbach(4, [2, 2]).
goldbach(N, Ans) :-
    N > 2,
    N mod 2 =:= 0,
    goldbach(N, 3, Ans).





% ########## utility predicates ###############################
is_prime(N, I) :-
    I*I >= N; N mod I =\= 0, I1 is I+2, is_prime(N, I1).
is_prime(2).
is_prime(N) :-
    integer(N), N > 2, N mod 2 =\= 0, is_prime(N, 3).
