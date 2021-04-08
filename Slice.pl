% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

% reture sublist in range [I, J) NOTE: J not including I, J are 1-based indexing.
slice(List, I, J, Slice) :-
    slice(List, 1, I, J, Slice).

slice(_, J, _, J, []).
slice([X|List], N, I, J, [X|Slice]) :-
    N >= I, N =< J,
    N1 is N + 1,
    slice(List, N1, I, J, Slice).
slice([_|List], N, I, J, Slice) :-
    N < I,
    N1 is N + 1,
    slice(List, N1, I, J, Slice).


