% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

pack([], []).
pack([X|Tail], [Xpack|ZTail]):-
    transfer(X, Tail, RestTail, Xpack), pack(RestTail, ZTail).

transfer(X, [], [], [X]). % why removing X from empty gives [X]? because in pack predicate we have already taken one X so to compensate that we need to put extra X in Xpack.
transfer(X, [Y|Tail], [Y|Tail], [X]):-
    X \= Y.
transfer(X, [X|Tail], RestTail, [X|Xpack]):-
    transfer(X, Tail, RestTail, Xpack).





% ############### another solution ##########################
% pack_conse_dup() counts consecutive duplicates elements in list.
pack_conse_dup([], []).
pack_conse_dup([X|ListTail], [[X|[C|[]]] | AnsTail]):-
	count_conse_dup([X|ListTail], X, C),
        remove_conse_dup(ListTail, X, RListTail),
	pack_conse_dup(RListTail, AnsTail).

% count_conse_dup() counts the consecutive duplicates element in list.
count_conse_dup([], _, 0).
count_conse_dup([Y|_], X, 0) :-
	X =\= Y.
count_conse_dup([X|ListTail], X, C) :-
	count_conse_dup(ListTail, X, CTail),
        C is CTail + 1.

% remove consecutive occurrence of element in list.
remove_conse_dup([], _, []).
remove_conse_dup([Y|Tail], X, [Y|Tail]) :-
    X =\= Y.
remove_conse_dup([X|Tail], X, Ans) :-
    remove_conse_dup(Tail, X, Ans).


