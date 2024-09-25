%11. Ingresar una lista de enteros e informar cuál es el mayor de todos los números.

inicio:-leer(L),mayor(L,0,M), writeln(M).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

mayor([],M,M).
mayor([H|T],MHM,MD):- H >= MHM, mayor(T,H,MD).
mayor([_|T],MHM,MD):- mayor(T,MHM,MD).
