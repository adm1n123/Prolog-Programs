% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in


get_comb(K, _, []) :-
    K =:= 0.
get_comb(K, List, [X|AnsTail]) :-
    K > 0,
    get_any_element(X, List, ListTail),
    K1 is K - 1,
    get_comb(K1, ListTail, AnsTail).

get_any_element(X, [X|ListTail], ListTail).
get_any_element(X, [_|Tail], ListTail) :-
    get_any_element(X, Tail, ListTail).

combination(K, List, Ans) :-
    get_comb(K, List, Ans).
