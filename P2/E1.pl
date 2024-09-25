%1. Ingresar una lista de elementos y mostrarla por pantalla.

inicio:-writeln("Ingrese lista: "), leer(Lista), writeln(Lista).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

/*En la consola ejecutar:
swipl
consult('/workspaces/IA/P2/E1.pl').
inicio.
|: hola.
|: como.
|: andas.
|: [].
Hay que ingresar el elemento, punto, enter y finalizar con una cadena vacia
*/