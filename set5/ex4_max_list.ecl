/* ----------------------------------
max_list/2
max_list(Max, List): 
A Prolog program that finds the max element in a List using not/1 and member/2.
1st argument/Max: The max element.
2nd arguemnt/List: A given list.
------------------------------------- */

max_list(Max, List) :- 
    member(Max, List),
    not((member(Y, List), Y > Max)).