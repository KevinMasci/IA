%Ingresar una lista y un elemento e informar cuántas veces está ese elemento en la lista.

inicio:-write('ingrese lista: '), leer(L), writeln('ingresar elemento: '),
    read(E), contar_repeticiones(L, E, Count), writeln(Count).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

contar_repeticiones([],_,0).
contar_repeticiones([E|T],E,Count):-contar_repeticiones(T,E,Rest), Count is Rest+1.
contar_repeticiones([H|T],E,Count):-H\=E, contar_repeticiones(T,E,Count).
