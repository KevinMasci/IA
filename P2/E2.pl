%2. Ingresar una lista de elementos y mostrar su cabeza y su cola.

inicio:-writeln("Ingrese lista: "), leer(Lista), mostrar(Lista).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

mostrar([H|T]):-writeln(H),writeln(T).