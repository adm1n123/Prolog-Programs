% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

:- ensure_loaded(library(bounds)).
:- use_module(library(clpfd), []).



valid(L) :- L in 1..9, all_different(L). 	% Binds L to any of the 4 values {1,2,3,4}.

const_rows([]).
const_rows([Row|Matrix]) :-
    sumlist(Row, Sum),
    Sum =:= 15,
    const_rows(Matrix).

check_col_sum([]).
check_col_sum([Col|Matrix]) :-
    sumlist(Col, Sum),
    Sum =:= 15,
    check_col_sum(Matrix).
const_cols(Matrix) :-
    clpfd:transpose(Matrix, Mtranspose),
    check_col_sum(Mtranspose).
    
left_diag_sum([], _, Sum, Sum).
left_diag_sum([Row|Rest], Rowno, Sum, Ans):-
	nth1(Rowno, Row, Elem),
	Sum1 is Sum + Elem,
	Rowno1 is Rowno + 1,
	left_diag_sum(Rest, Rowno1, Sum1, Ans).
left_diag_sum(M, Ans) :-
    left_diag_sum(M, 1, 0, Ans).

right_diag_sum([], _, Sum, Sum).
right_diag_sum([Row|Rest], Rowno, Sum, Ans):-
	nth1(Rowno, Row, Elem),
	Sum1 is Sum + Elem,
	Rowno1 is Rowno - 1,
	right_diag_sum(Rest, Rowno1, Sum1, Ans).
right_diag_sum(M, Ans) :-
    nth1(1, M, Row),
    length(Row, Len),
    right_diag_sum(M, Len, 0, Ans).

const_diag(Matrix) :-
    left_diag_sum(Matrix, LDSum), LDSum =:= 15,
    right_diag_sum(Matrix, RDSum), RDSum =:= 15.

constraints(Matrix) :-
    const_rows(Matrix),
    const_cols(Matrix),
    const_diag(Matrix).
    
magic_square([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]) :- 
    valid([X11,X12,X13, X21,X22,X23, X31,X32,X33]),
    labeling([],[X11,X12,X13, X21,X22,X23, X31,X32,X33]),
    constraints([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]),
    print_matrix([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]).



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
