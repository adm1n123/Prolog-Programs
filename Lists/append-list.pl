% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

my_append([], X, X).
my_append([X|Tail], L2, [X|AnsTail]) :-
    my_append(Tail, L2, AnsTail).



