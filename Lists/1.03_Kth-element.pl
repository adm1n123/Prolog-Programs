% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

element_at(X, [X|_], 1).
element_at(X, [_|Tail], Pos):-
    Pos > 1, Npos is Pos - 1, element_at(X, Tail, Npos).

