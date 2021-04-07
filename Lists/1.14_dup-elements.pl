% author: Deepak Singh Baghel   email: deepakbaghel@cse.iitb.ac.in




make_dupli([], []).
make_dupli([X|ListTail], [X|[X|AnsTail]]) :-
    make_dupli(ListTail, AnsTail).

dupli(List, Ans) :-
    make_dupli(List, Ans).

