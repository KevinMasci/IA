%6. Ingresar una lista de números enteros y calcular la diferencia entre el primero y el último de ellos.

%Se utiliza recursividad

inicio:-leer([H|T]), traer_ultimo([H|T],U), Dif is H-U, writeln(Dif).

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

traer_ultimo([H],H).
traer_ultimo([_|T],U):-traer_ultimo(T,U).
