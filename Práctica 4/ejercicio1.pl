inicio:-abrir_base,
        mostrar,
        agregarNuevo,
        guardar,
        mostrar.

abrir_base:-consult('BD.txt').

mostrar:-
    pagar(P, S, M),
    format('~w tiene que pagar ~w por un monto de ~w.~n', [P, S, M]),
    fail.
mostrar.

agregarNuevo:-write('Ingrese persona:'), read(P), 
              write('Ingrese servicio:'), read(S), 
              write('Ingrese monto:'), read(M),
              assert(pagar(P, S, M)).

guardar:-tell('BD.txt'), listing(persona), told.
