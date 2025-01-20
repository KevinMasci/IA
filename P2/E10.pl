/*10. Ingresar una lista y un elemento e informar si ese elemento está en la
lista.*/

inicio:-write('ingrese lista: '), leer(L), writeln('ingrese un elemento a buscar: ')
        , read(E), buscar_elemento(L,E).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

buscar_elemento([],_):-writeln('el elemento no se encuentra en la lista').
buscar_elemento([H|_],H):-writeln('el elemento se encuentra en la lista').
buscar_elemento([_|T],E):- buscar_elemento(T,E).


%VER DIAPOSITIVA
