/* ----------------------------------
Exercise 1
------------------------------------- */

%%% transitions/3
transitions(s1, 10, s2).
transitions(s1, 20, s3).
transitions(s1, 50, s6).
transitions(s2, 10, s3).
transitions(s2, 20, s4).
transitions(s3, 10, s4).
transitions(s3, 20, s5).
transitions(s4, 10, s5).
transitions(s4, 20, s6).
transitions(s5, 10, s6).

%%% coins_to_insert/3
coins_to_insert(Loc1, Loc2, [Coin]) :- 
    transitions(Loc1, Coin, Loc2).

coins_to_insert(Loc1, Loc2, [Coin|CoinList]) :- 
    transitions(Loc1, Coin, NewLoc),
    coins_to_insert(NewLoc, Loc2, CoinList).

/* ----------------------------------
Exercise 2 - Euler's Problem, Bridges of Konigsberg 
------------------------------------- */

%%% connect/3 
connect(i1,i2,b1).
connect(rb1,i1,b2).
connect(rb1,i1,b3).
connect(rb1,i2,b4).
connect(rb2,i1,b5).
connect(rb2,i1,b6).
connect(rb2,i2,b7).

%%% connection/3
connection(Loc1,Loc2,Bridge):-
    connect(Loc1,Loc2,Bridge).

connection(Loc1,Loc2,Bridge):-
    connect(Loc2,Loc1,Bridge).

%%% walk/3
walk(Loc1,Loc2,Path):-
    walk(Loc1,Loc2,[],Path).

%%% walk/4
walk(Loc1,Loc2,Visited,[Bridge]):-
    connection(Loc1,Loc2,Bridge),
    not(member(Bridge,Visited)).

walk(Loc1,Loc2,Visited,[Bridge|Rest]):-
    connection(Loc1,LocX,Bridge),
    not(member(Bridge,Visited)),
    walk(LocX,Loc2,[Bridge|Visited],Rest).

%%% A proof that there is no path that goes through every bridge
%%% total number of bridges are seven, so a path of length 7.
no_euler:-
    member(Loc1,[rb1,rb2,i1,i2]),	
    member(Loc2,[rb1,rb2,i1,i2]),	
    walk(Loc1,Loc2,Path),
    length(Path,7).	

%%% These are the solutions
euler_v1:-
     not( (walk(_L1,_L2,P),length(P,7)) ). 


euler_v2:-
	findall(P,walk(_L1,_L2,P),Paths),
	length(Desired,7),
	not(member(Desired,Paths)).

euler_v3:-
	findall(P,walk(_L1,_L2,P),Paths),
	not((member(Desired,Paths),length(Desired,7))).