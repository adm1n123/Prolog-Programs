% Test the binary representation of bits in List equals to A.
isBinEqual([], A, A).
isBinEqual([B|Rest], X, A):-
	Z is X * 2 + B, isBinEqual(Rest, Z, A).
binvalue(List, A):-
	isBinEqual(List, 0, A).
