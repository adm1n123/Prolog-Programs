% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in


:- use_module(library(clpfd)). % :- use_module(library(clpfd), []). use this incase of import conflicts.


valid(L) :- L in 1..9, all_different(L). 	% Binds L to any of the 4 values {1,2,3,4}.

% returns the nth row
nth_row(N, Matrix, Ans) :-
    nth1(N, Matrix, Ans).

% returns the nth col
nth_col(N, Matrix, Ans) :-
    transpose(Matrix, Mtranspose),
    nth1(N, Mtranspose, Ans).

% find sum of left diagonal elements
left_diag([], _, []).
left_diag([Row|Rest], Rowno, [Elem|LDiag]):-
	nth1(Rowno, Row, Elem),	
	Rowno1 is Rowno + 1,
	left_diag(Rest, Rowno1, LDiag).
left_diag(M, LDiag) :-
    left_diag(M, 1, LDiag).

% find sum of right diagonal elements
right_diag([], _, []).
right_diag([Row|Rest], Rowno, [Elem|RDiag]):-
	nth1(Rowno, Row, Elem),	
	Rowno1 is Rowno - 1,
	right_diag(Rest, Rowno1, RDiag).
right_diag(M, RDiag) :-
    nth1(1, M, Row),
    length(Row, Len),
    right_diag(M, Len, RDiag).


rotate_clock(_, Col, Len, []) :- Col =:= Len + 1.
rotate_clock(Matrix, Col, Len, [RRow|Ans]) :-
    Col =< Len,
    nth_col(Col, Matrix, Row),
    reverse(Row, RRow),
    Col1 is Col + 1,
    rotate_clock(Matrix, Col1, Len, Ans).
rotate_clock(M, Ans) :-
    nth1(1, M, Row),
    length(Row, Len),
    rotate_clock(M, 1, Len, Ans).


% print matrix of arbitrary size.
print_matrix([]).
print_matrix([Row|Tail]) :-
    write("["), print_list(Row), write("]\n"),
    print_matrix(Tail).
print_list([X]) :- write(X).
print_list([X|Tail]) :-
    length(Tail, Tlen),
    Tlen > 0,
    write(X), write("\t"),
    print_list(Tail).



