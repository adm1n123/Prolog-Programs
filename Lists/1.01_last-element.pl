% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

last_element(X, [X]).
last_element(X, [_|Rest]):-
    last_element(X, Rest).

