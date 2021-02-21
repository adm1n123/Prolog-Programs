% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in
compress([], []).
compress([X], [X]).
compress([X,X|Tail], Comp):-
    compress([X|Tail], Comp).
compress([X,Y|Tail], [X|CompTail]):-
    compress([Y|Tail], CompTail).



rmv_prefix([], _, []).
rmv_prefix([Y|Tail], X, [Y|Tail]):-
    X \= Y.
rmv_prefix([X|Tail], X, Suffix):-
    rmv_prefix(Tail, X, Suffix).
% you can combine both predicates since no of params is different.
% rmv_prefix will remove all occurrences of X from prefix of 1st param
% and return result in Suffix.

rmv_dup([], []).
rmv_dup([X|Tail], [X|AnsTail]):-
    rmv_prefix(Tail, X, Suffix), rmv_dup(Suffix, AnsTail).

