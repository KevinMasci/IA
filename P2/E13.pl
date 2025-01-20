%Ingresar dos listas de elementos, concatenarlas (los elementos deben ser asignados de a uno en la lista de salida) y mostrarlas en una tercera.

inicio:-write('ingrese lista 1: '), leer(L1), write('ingrese lista 2: '), leer(L2),
         concatenar(L1,L2,L3), writeln(L3).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

concatenar([],L2,L2).
concatenar([H|T], L2, [H|L3]):-concatenar(T, L2, L3).
