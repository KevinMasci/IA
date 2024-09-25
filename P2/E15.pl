%15. Ingresar una lista y determinar a través de una segunda lista todos los elementos que se repiten.

inicio:-leer(L),repetidos(L,LR),writeln(LR).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

repetidos([],[]).
repetidos([H1|T1],[H1|T2]):-pertenece(H1,T1),repetidos(T1,T2).
repetidos([_|T],LR):-repetidos(T,LR).
