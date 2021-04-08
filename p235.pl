% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

counter(1).
counter(A) :- counter(B), A is B + 1 .

p235(A) :- counter(A), test_p235(A).

test_p235(1).    
test_p235(A) :- B is A mod 2,
    B == 0, C is A // 2,
    test_p235(C).
test_p235(A) :- B is A mod 3,
    B == 0, C is A // 3,
    test_p235(C).
test_p235(A) :-
    B is A mod 5, B == 0,
    C is A // 5, test_p235(C).
