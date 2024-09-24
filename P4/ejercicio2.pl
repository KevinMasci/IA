inicio :-
    write('Ingresa un código: '),
    read(C),
    consultar,
    mostrar(C),
    guardar.

consultar:-consult('BD.txt').

mostrar(C):-
    persona(C, N),
    write(N).

mostrar(C):-
    write('Ingrese nombre: '),
    read(N),
    assert(persona(C,N)).

guardar:-tell('BD.txt'), listing(persona), told.