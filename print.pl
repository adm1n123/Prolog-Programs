% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

% print jagged matrix.
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


