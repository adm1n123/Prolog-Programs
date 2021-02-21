% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

my_reverse(List, Reverse):-
    rev(List, Reverse, []).

rev([], Reverse, Reverse).
rev([X|Tail], Reverse, PrefixRev):-
    rev(Tail, Reverse, [X|PrefixRev]).

