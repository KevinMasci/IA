% Hechos dinámicos
:- dynamic(electrodomestico/8).

% Base de conocimiento inicial
electrodomestico('samsung rt38k5032s8', refrigerador, 384, 'a++', ['no frost', 'twin cooling plus'], 700, 'samsung', si).
electrodomestico('lg gc-b247sluv', refrigerador, 601, 'a+', ['instaview', 'no frost'], 1500, 'lg', si).

% Limpiar pantalla
clearScreen :- write('\e[H\e[2J').

% Cargar conocimiento
cargarConocimiento :-
    retractall(electrodomestico(_,_,_,_,_,_,_,_)),
    consult('/workspaces/IA/TP/BD.txt').  % Cambiar ruta si es necesario

% Identificar usuario
identificacionUsuario(Usuario) :-
    writeln("¡bienvenido al sistema experto de electrodomesticos!"), nl,
    write("primero que todo, me gustaria conocerte un poco mejor. ¿como te llamas?: "), read(Usuario), nl.

% Saludar usuario
saludarUsuario(Usuario) :-
    write("hola, "), write(Usuario), writeln(", ¡es un placer ayudarte hoy!"),
    writeln("voy a hacerte algunas preguntas para encontrar el electrodomestico que mejor se ajuste a tus necesidades."), nl.

% Validar tipos de electrodomesticos
validarTipos :-
    writeln("para empezar, ¿que tipo de electrodomestico estas buscando hoy?"),
    writeln("(ej: refrigerador, lavadora, horno, etc.)"), nl,
    write("> "), read(Tipo), nl,
    confirmarTipo(Tipo).

% Confirmar tipo de electrodomestico
confirmarTipo(Tipo) :-
    write("¿estas buscando un "), write(Tipo), writeln("? [s/n]"),
    read(Respuesta),
    validarRespuestaTipo(Respuesta, Tipo).

% Validar la respuesta
validarRespuestaTipo('s', Tipo) :-
    preguntarEspecificaciones(Tipo).

validarRespuestaTipo('n', _) :-
    writeln("entendido. intentemos de nuevo."),
    validarTipos.

validarRespuestaTipo(_, Tipo) :-
    writeln("no entendi tu respuesta. por favor, responde con 's' o 'n'."),
    confirmarTipo(Tipo).

% Preguntar especificaciones del electrodomestico
preguntarEspecificaciones(Tipo) :-
    write("¿tienes alguna preferencia sobre la capacidad del "), write(Tipo), writeln("? [s/n]"),
    read(RespuestaCapacidad),
    validarRespuestaCapacidad(RespuestaCapacidad, Tipo).

% Validar la respuesta sobre la capacidad
validarRespuestaCapacidad('s', Tipo) :-
    pedirCapacidad(Tipo).

validarRespuestaCapacidad('n', Tipo) :-
    writeln("no te preocupes, puedo mostrarte todas las opciones disponibles."),
    preguntarEficienciaEnergetica(Tipo,_).

validarRespuestaCapacidad(_, Tipo) :-
    writeln("por favor, responde con 's' o 'n'."),
    preguntarEspecificaciones(Tipo).

% Pedir preferencia de capacidad
pedirCapacidad(Tipo) :-
    write("¿cuanta capacidad prefieres? (en litros, ej: 300): "),
    read(Capacidad),
    writeln("¡perfecto! voy a buscar modelos que tengan una capacidad de al menos "), write(Capacidad), writeln(" litros."),
    preguntarEficienciaEnergetica(Tipo, Capacidad).

% Preguntar por eficiencia energetica
preguntarEficienciaEnergetica(Tipo, Capacidad) :-
    write("¿te importa la eficiencia energetica del electrodomestico? [s/n] "),
    read(RespuestaEficiencia),
    validarRespuestaEficiencia(RespuestaEficiencia, Tipo, Capacidad).

% Validar la respuesta sobre la eficiencia energetica
validarRespuestaEficiencia('s', Tipo, Capacidad) :-
    pedirEficienciaEnergetica(Tipo, Capacidad).

validarRespuestaEficiencia('n', Tipo, Capacidad) :-
    writeln("esta bien. puedo mostrarte opciones con diferentes niveles de eficiencia."),
    preguntarFunciones(Tipo, Capacidad, _).

validarRespuestaEficiencia(_, Tipo, Capacidad) :-
    writeln("por favor, responde con 's' o 'n'."),
    preguntarEficienciaEnergetica(Tipo, Capacidad).

% Pedir preferencia de eficiencia energetica
pedirEficienciaEnergetica(Tipo, Capacidad) :-
    write("¿que nivel de eficiencia energetica te gustaria? (ej: a++, a+, etc.): "),
    read(Eficiencia),
    writeln("muy bien, buscare electrodomesticos con eficiencia "), write(Eficiencia), writeln("."),
    preguntarFunciones(Tipo, Capacidad, Eficiencia).

% Preguntar por funciones
preguntarFunciones(Tipo, Capacidad, Eficiencia) :-
    writeln("¿tienes alguna funcion especifica en mente que te gustaria que tuviera el electrodomestico? [s/n] "),
    read(RespuestaFunciones),
    validarRespuestaFunciones(RespuestaFunciones, Tipo, Capacidad, Eficiencia).

% Validar la respuesta sobre funciones
validarRespuestaFunciones('s', Tipo, Capacidad, Eficiencia) :-
    pedirFunciones(Tipo, Capacidad, Eficiencia).

validarRespuestaFunciones('n', Tipo, Capacidad, Eficiencia) :-
    writeln("no te preocupes, puedo mostrarte todas las funciones disponibles."),
    preguntarPrecio(Tipo, Capacidad, Eficiencia, _).

validarRespuestaFunciones(_, Tipo, Capacidad, Eficiencia) :-
    writeln("por favor, responde con 's' o 'n'."),
    preguntarFunciones(Tipo, Capacidad, Eficiencia).

% Pedir preferencia de funciones
pedirFunciones(Tipo, Capacidad, Eficiencia) :-
    write("¿que funciones te gustaria que tuviera el electrodomestico? (lista, ej: ['no frost', 'instaview']): "),
    read(Funciones),
    writeln("¡perfecto! buscare electrodomesticos con esas funciones."), nl,
    preguntarPrecio(Tipo, Capacidad, Eficiencia, Funciones).

% Preguntar por precio
preguntarPrecio(Tipo, Capacidad, Eficiencia, Funciones) :-
    writeln("¿tienes un presupuesto en mente para este electrodomestico? [s/n] "),
    read(RespuestaPrecio),
    validarRespuestaPrecio(RespuestaPrecio, Tipo, Capacidad, Eficiencia, Funciones).

% Validar la respuesta sobre precio
validarRespuestaPrecio('s', Tipo, Capacidad, Eficiencia, Funciones) :-
    pedirPrecio(Tipo, Capacidad, Eficiencia, Funciones).

validarRespuestaPrecio('n', Tipo, Capacidad, Eficiencia, Funciones) :-
    writeln("esta bien, te mostrare opciones dentro de un rango amplio de precios."),
    buscarElectrodomesticos(Tipo, Capacidad, Eficiencia, Funciones, _).

validarRespuestaPrecio(_, Tipo, Capacidad, Eficiencia, Funciones) :-
    writeln("por favor, responde con 's' o 'n'."),
    preguntarPrecio(Tipo, Capacidad, Eficiencia, Funciones).

% Pedir preferencia de precio
pedirPrecio(Tipo, Capacidad, Eficiencia, Funciones) :-
    write("¿cual es tu presupuesto maximo en dolares? "),
    read(Precio),
    writeln("¡muy bien! buscare electrodomesticos por debajo de $"), write(Precio), writeln("."),
    buscarElectrodomesticos(Tipo, Capacidad, Eficiencia, Funciones, Precio).

% Buscar electrodomesticos por tipo y especificaciones
buscarElectrodomesticos(Tipo, Capacidad, Eficiencia, Funciones, Precio) :-
    writeln("Buscando electrodomésticos que cumplan con tus preferencias..."), nl,
    electrodomestico(Nombre, Tipo, CapacidadAct, EficienciaAct, FuncionesAct, PrecioAct, Marca, Inteligente),
    validarElectrodomestico(CapacidadAct, Capacidad, EficienciaAct, Eficiencia, FuncionesAct, Funciones, PrecioAct, Precio, Nombre, Tipo, Marca, Inteligente),
    fail.

buscarElectrodomesticos(_, _, _, _, _) :-
    writeln("No encontré más electrodomésticos que cumplan con tus preferencias, ni aproximados.").

% Validar características del electrodoméstico
validarElectrodomestico(CapacidadAct, Capacidad, EficienciaAct, Eficiencia, FuncionesAct, Funciones, PrecioAct, Precio, Nombre, Tipo, Marca, Inteligente) :-
    validarCapacidad(CapacidadAct, Capacidad),
    validarEficiencia(EficienciaAct, Eficiencia),
    validarFunciones(FuncionesAct, Funciones),
    validarPrecio(PrecioAct, Precio),
    mostrarElectrodomestico(Nombre, Tipo, CapacidadAct, EficienciaAct, FuncionesAct, PrecioAct, Marca, Inteligente).
% Validar capacidad
validarCapacidad(_, Capacidad) :- var(Capacidad), !.
validarCapacidad(CapacidadAct, Capacidad) :- CapacidadAct >= Capacidad.

% Validar eficiencia
validarEficiencia(_, Eficiencia) :- var(Eficiencia), !.
validarEficiencia(EficienciaAct, Eficiencia) :- EficienciaAct == Eficiencia.

% Validar funciones
validarFunciones(_, Funciones) :- var(Funciones), !.
validarFunciones(FuncionesAct, Funciones) :- subset(Funciones, FuncionesAct).

% Validar precio
validarPrecio(_, Precio) :- var(Precio), !.
validarPrecio(PrecioAct, Precio) :- PrecioAct =< Precio.

% Mostrar detalles del electrodomestico
mostrarElectrodomestico(Nombre, Tipo, Capacidad, Eficiencia, Funciones, Precio, Marca, Inteligente) :-
    nl, writeln("aqui tienes una opcion interesante:"),
    write("nombre: "), writeln(Nombre),
    write("capacidad: "), write(Capacidad), writeln(" litros"),
    write("eficiencia energetica: "), writeln(Eficiencia),
    write("funciones: "), writeln(Funciones),
    write("precio: $"), writeln(Precio),
    write("marca: "), writeln(Marca),
    write("¿es inteligente?: "), writeln(Inteligente), nl,
    continuarBusqueda.


% Preguntar si el usuario quiere seguir buscando
continuarBusqueda :-
    writeln("¿Te gustaria ver más opciones? [s/n]"),
    read(Respuesta),
    (Respuesta == 's' -> fail;
     Respuesta == 'n' -> writeln("¡Espero haberte ayudado a encontrar lo que necesitas!") ;
     writeln("Por favor, responde con 's' o 'n'."), continuarBusqueda).

% Funcion principal recomendame (restaurada)
recomendame :-
    clearScreen,
    cargarConocimiento,
    identificacionUsuario(Usuario),
    saludarUsuario(Usuario),
    validarTipos,
    despedirUsuario(Usuario).

% Despedir usuario
despedirUsuario(Usuario) :-
    nl, write("Gracias por usar el sistema, "), write(Usuario), writeln("! Que tengas un buen dia.").

% Subset
subset([], _).
subset([H|T], List) :- member(H, List), subset(T, List).

% Menú principal
menu :-
   %% clearScreen,
    writeln("¿Que te gustaria hacer hoy?"),
    writeln("1. Buscar un electrodomestico"),
    writeln("2. Salir"),
    write("Elige una opcion (1-2): "), read(Opcion),
    ejecutarOpcion(Opcion).

% Ejecutar la opcion elegida por el usuario
ejecutarOpcion(1) :- recomendame, nl, menu.
ejecutarOpcion(2):-writeln('Adios.').
ejecutarOpcion(_):-writeln('Opcion No valida'),menu.