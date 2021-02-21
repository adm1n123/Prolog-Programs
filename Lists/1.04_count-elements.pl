% author: Deepak Singh Baghel, mail: deepakbaghel@cse.iitb.ac.in

count_element([], 0).
count_element([_|Tail], Count):-
    count_element(Tail, CountTail), Count is CountTail + 1.


