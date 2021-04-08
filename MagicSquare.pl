% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in



list([1, 2, 3, 4, 5, 6, 7, 8, 9]).

magic_square([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]) :- 
    valid([X11,X12,X13, X21,X22,X23, X31,X32,X33]),
    labeling([],[X11,X12,X13, X21,X22,X23, X31,X32,X33]),
    constraints([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]),
    print_matrix([[X11,X12,X13], [X21,X22,X23], [X31,X32,X33]]).
    
