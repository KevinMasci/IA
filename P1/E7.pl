/*7. Escribir un programa que simule una calculadora para las operaciones
matemáticas básicas (suma, resta, multiplicación y división) entre dos
valores numéricos, informando el resultado.*/

menu:-writeln('Ingrese el primer número: '), read(N1),
      writeln('Ingrese el segundo número: '), read(N2),
      writeln('¿Que operación desea realizar?'),
      writeln('1 - Suma'),
      writeln('2 - Resta'),
      writeln('3 - Multiplicación'),
      writeln('4 - División'),
      writeln('5 - Salir'),
      read(Opc),
      Opc \=5,
      opcion(Opc,N1,N2),
      menu.
menu:-writeln("Adios").

opcion(1,N1,N2):-Suma is N1+N2, writeln(Suma).
opcion(2, N1,N2):- Resta is N1 - N2, writeln(Resta).
opcion(3,N1,N2):- Multiplicación is N1*N2, writeln(Multiplicación).
opcion(4,N1,N2):- División is N1/N2, writeln(División).
opcion(_,_,_):-writeln('Opción invalida').

