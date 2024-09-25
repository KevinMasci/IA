/*4. Ampliar el ejercicio 1 a través del uso de functores. Por ejemplo:
gasto(maria, super(coto,500)).
gasto(omar, tel(fijo,telecom,150)).
gasto(maria,tel(movil,personal,100)).
a. Ingresar un gasto (por ej. super) e informar todas las personas que
tienen dicho gasto.
b. Informar las personas que tienen un consumo superior a los $150 en un
cierto gasto (dato de entrada).
c. Calcular gasto promedio para una determinada persona (dato de
entrada).*/

%gasto(nombre,functorGastos).
:-dynamic(gasto/2).
:- dynamic retractll/1.
%gasto(nombre,supermercado(monto)).

abrir:-retractll(gasto(_,_)), consult('/workspaces/IA/P4/BD4.txt').

guardar:-tell('/workspaces/IA/P4/BD4.txt'), listing(gasto),told.

inicio:-abrir,menu.

menu:-writeln(''),writeln(''),writeln(''),
      writeln('Ingrese opcion: '),
      writeln('1-Cargar gasto supermercado'),
      writeln('2-Informe por gasto de supermercado'),
      writeln('3-Consumo superior 150 en supermercado'),
      writeln('4-Gasto promedio en supermercado por persona'),
      writeln('5-Salir'),
      read(Op), Op<5, opcion(Op),menu.
menu:-writeln('Adios').

opcion(1):-writeln('Ingrese Nombre de Persona: '), read(N),
           writeln('Ingrese gasto de supermercado: '), read(M),
           assert(gasto(N,supermercado(M))),
           guardar.

opcion(2):-writeln('Personas con gato de supermercado: '),
           gasto(N,supermercado(_)),
           writeln(N),
           fail.

opcion(3):-writeln('Personas con consumo superior a 150 en supermercado: '),
           gasto(N,supermercado(M)),
           M>150,
           writeln(N),
           fail.

opcion(4):-writeln('Ingrese nombre de Persona: '),
           read(N),
           promediar_gasto_supermercado(N,S,C),
           P is S/C,
           writeln(P),
           abrir.

opcion(_).

promediar_gasto_supermercado(N,S,C):-gasto(N,supermercado(M)),
                                     retract(gasto(N,supermercado(M))),
                                     promediar_gasto_supermercado(N,SP,CP),
                                     S is SP + M,
                                     C is CP + 1.

promediar_gasto_supermercado(_,0,0).

