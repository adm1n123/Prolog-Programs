% author: Deepak Singh Baghel  mail: deepakbaghel@cse.iitb.ac.in

gcd(0, X, X).
gcd(X, 0, X).
gcd(X, Y, Ans) :-
    X > 0,
    Y > 0,
    Mod is X mod Y,
    gcd(Y, Mod, Ans).


