% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

% This subsetsum treats all elements distinct hence it produces duplicates output.
subsetsum([], 0, []).

subsetsum([_|Tail], Sum, Ans):-
    subsetsum(Tail, Sum, Ans).

subsetsum([X|Tail], Sum, [X|AnsTail]):-
    RSum is Sum - X,
    subsetsum(Tail, RSum, AnsTail).

sSet(List, Sum, Ans):-
    subsetsum(List, Sum, Ans).
