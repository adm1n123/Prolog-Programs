% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

% Subset sum with unique results no duplicates
% Explanation: sort the list then create new list with element and its
% count eg. [[a, 3], [b, 1], [c, 2] ... ] then start from first element
% and call subsetsum for each count of element eg. subsetsum for 0, 1,
% 2, 3 occurrences of a solve rest recursively then call subsetsum for
% 0, 1 occurrences of b and so on...

% This process_element will include current element into answer.
process_element([[X|[_|[]]] | PackTail], Times, Amount, Ans) :-
    Times > 0,
    Amount1 is Amount - X * Times,
    fill_element(Ans, AnsTail, X, Times),
    subsetsum(PackTail, 0, Amount1, AnsTail).

% This process_element will ignore current element.
process_element([[_|[_|[]]] | PackTail], Times, Amount, Ans) :-
    Times =:= 0,
    subsetsum(PackTail, 0, Amount, Ans).

% if Amount is zero answer is []
subsetsum(_, _, 0, []).

% This will call process element to include Times no. of element.
subsetsum([[X|[C|[]]] | PackTail], Times, Amount, Ans) :-
    Amount > 0,
    C >= Times,
    process_element([[X|[C|[]]] | PackTail], Times, Amount, Ans).

% This will call subsetsum for all occurrences(Times) of same element.
% process_element will remove element and again call this susetsum
% to proceed with next element.
subsetsum([[X|[C|[]]] | PackTail], Times, Amount, Ans) :-
    Amount > 0,
    C > Times,
    Times1 is Times + 1,
    Amount1 is Amount - X * Times1,
    Amount1 >= 0,
    subsetsum([[X|[C|[]]] | PackTail], Times1, Amount, Ans).

sSet(List, Amount, Ans) :-
    pack_dup(List, Pack),
    subsetsum(Pack, 0, Amount, Ans).


% ##################### Utility ###################

fill_element([X|ListTail], ListTail, X, Times) :-
    Times =:= 1.
fill_element([X|List], ListTail, X, Times) :-
    Times > 1,
    Times1 is Times - 1,
    fill_element(List, ListTail, X, Times1).


% count occurrences of elements in list.
pack_dup(List, Pack) :-
    msort(List, SortedList),
    pack_conse_dup(SortedList, Pack).

% pack_conse_dup() counts consecutive duplicates elements in list.
pack_conse_dup([], []).
pack_conse_dup([X|ListTail], [[X|[C|[]]] | AnsTail]):-
	count_conse_dup([X|ListTail], X, C),
        remove_conse_dup(ListTail, X, RListTail),
	pack_conse_dup(RListTail, AnsTail).

% count_conse_dup() counts the consecutive duplicates element in list.
count_conse_dup([], _, 0).
count_conse_dup([Y|_], X, 0) :-
	X =\= Y.
count_conse_dup([X|ListTail], X, C) :-
	count_conse_dup(ListTail, X, CTail),
        C is CTail + 1.

% remove consecutive occurrence of element in list.
remove_conse_dup([], _, []).
remove_conse_dup([Y|Tail], X, [Y|Tail]) :-
    X =\= Y.
remove_conse_dup([X|Tail], X, Ans) :-
    remove_conse_dup(Tail, X, Ans).


