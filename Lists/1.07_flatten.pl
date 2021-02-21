% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

my_flatten([], []).
my_flatten([X|Tail], Flat):-
    is_list(X), my_flatten(X, FlatX), my_flatten(Tail, FlatTail), append(FlatX, FlatTail, Flat).
my_flatten([X|Tail], [X|FlatTail]):-
    my_flatten(Tail, FlatTail).


% flatten/2 is predefined predicate.
