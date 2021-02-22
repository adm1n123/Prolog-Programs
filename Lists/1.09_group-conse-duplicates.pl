% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

pack([], []).
pack([X|Tail], [Xpack|ZTail]):-
    transfer(X, Tail, RestTail, Xpack), pack(RestTail, ZTail).

transfer(X, [], [], [X]). % why removing X from empty gives [X]? because in pack predicate we have already taken one X so to compensate that we need to put extra X in Xpack.
transfer(X, [Y|Tail], [Y|Tail], [X]):-
    X \= Y.
transfer(X, [X|Tail], RestTail, [X|Xpack]):-
    transfer(X, Tail, RestTail, Xpack).

