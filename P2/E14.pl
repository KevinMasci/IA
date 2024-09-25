%14. Ingresar una lista y determinar el primer elemento que se repite.

inicio:-leer(L), primer_repetido(L).

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

primer_repetido([H|T]):-pertenece(H,T), write("El primer repetido es: "), writeln(H).
primer_repetido([_|T]):-primer_repetido(T).
primer_repetido([]):-writeln("No hay ningun repetido en esta lista").
