%7. Ingresar una lista de elementos e informar cuántos elementos tiene.
inicio:- leer(Lista), contar(Lista,Cant), write(Cant).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

contar([],0).
contar([_|T],Cant):-contar(T,Cant_cola),
                    Cant is Cant_cola + 1.
