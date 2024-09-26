/*6. Escribir un programa Prolog que ayude a un organizador a armar un
festival, considerando las diferentes bandas de música que se pueden
formar en cada ciudad.
Para formar una banda son necesarios un guitarrista, un cantante y un
baterista. Se dispone de la siguiente información:
• Carolina y José son guitarristas y viven en Rosario.
• Miguel es guitarrista y vive en Funes.
• Mariano es un cantante que vive en Rosario.
• Silvia es una cantante que vive en Funes.
• Eduardo es un baterista que vive en Roldán.
• Diego es un baterista que vive en Casilda.
• Laura es una baterista que vive en Rosario.
• Mauro es cantante y vive en Funes.
El programa debe responder si en una ciudad (dato de entrada), se puede o
no formar una banda.*/

%intrumento(persona, instrumento).
instrumento(carolina, guitarrista).
instrumento(jose, guitarrista).
instrumento(miguel,guitarrista).
instrumento(mariano, cantante).
instrumento(silvia, cantante).
instrumento(eduardo, baterista).
instrumento(diego,baterista).
instrumento(laura,baterista).
instrumento(mauro, cantante).

%ciudad(persona,ciudad)
ciudad(carolina, rosario).
ciudad(jose, rosario).
ciudad(miguel, funes).
ciudad(mariano, rosario).
ciudad(silvia, funes).
ciudad(eduardo,roldan).
ciudad(diego, casilda).
ciudad(laura, rosario).
ciudad(mauro, funes).