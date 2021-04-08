% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in


cc(0,[X],[0]). /* base case */
/* don't use first coin at all! */
cc(A,[C1|R],[0|L]) :- cc(A,R,L).
/* use first coin, if possible, at least once */
cc(A,[C1|R],[N|L]) :- A >= C1,
    A1 is A - C1,
    cc(A1,[C1|R],[N1|L]),
    N is N1 + 1.
