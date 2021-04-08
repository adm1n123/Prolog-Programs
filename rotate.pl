% author: Deepak Singh Baghel mail: deepakbaghel@cse.iitb.ac.in

% Circular left shift once
left_shift([], []).
left_shift([X|ListTail], Lshifted) :-
    append(ListTail, [X|[]], Lshifted).

% Circular left shift n times
left_shift(List, List, 0).
left_shift(List, NLshifted, N) :-
    N > 0,
    N1 is N -1,
    left_shift(List, Lshifted),
    left_shift(Lshifted, NLshifted, N1).


% Circular right shift once
right_shift([], []).
right_shift(List, Rshifted) :-
    reverse(List, Reversed),
    left_shift(Reversed, Lshifted),
    reverse(Lshifted, Rshifted).

% Circular right shift n times
right_shift(List, List, 0).
right_shift(List, NRshifted, N) :-
    N > 0,
    N1 is N -1,
    right_shift(List, Rshifted),
    right_shift(Rshifted, NRshifted, N1).

% Circular shift +ve for right, -ve for left
shift(List, Shifted, N) :-
    N >= 0,
    right_shift(List, Shifted, N).
shift(List, Shifted, N) :-
    N < 0,
    N1 is -N,
    left_shift(List, Shifted, N1).



