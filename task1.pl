%На базе имеющихся предикатов, описывающих родственные отношения: man(symbol), woman(symbol), parent(symbol, symbol), 
%Kol_det(symbol, symbol, integer), mother(symbol), father(symbol). Определить предикаты брат, сестра, дядя, бабушка.
 

man(me).
man(father).
man(bro1).
man(bro2).
man(grandfather).

woman(mother).
woman(sister).
woman(aunt).
woman(grandmother).

parent(me, father).
parent(bro1, father).
parent(bro2, father).
parent(sister, father).

parent(me, mother).
parent(bro1, mother).
parent(bro2, mother).
parent(sister, mother).

parent(father, grandfather).
parent(mother, grandmother).
parent(aunt, grandmother).

father_(father).
father_(grandfather).

mother_(mother).
mother_(grandmother).

% dummy
kol_det(_, _, _).

is_brother(X, Y):-
	man(Y),
	parent(X, G),
	parent(Y, G),
	X \== Y.

is_sister(X, Y):-
        woman(Y),
        parent(X, G),
        parent(Y, G),
        X \== Y.

is_uncle(X, Y):-
	woman(Y),
	parent(X, Z),
	is_brother(Z, Y).

is_grandmother(X, Y):-
	woman(Y),
	parent(X, Z),
	mother_(Y),
	parent(Z, Y).
