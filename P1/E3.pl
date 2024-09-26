/*3. Escribir un programa Prolog que responda consultas acerca de cuáles son
los rivales de una determinada selección en un campeonato mundial.
Una selección tiene como rivales todos los otros equipos de su mismo
grupo.
Incluir en el programa la siguiente información:
• El grupo 1 está formado por Brasil, España, Jamaica e Italia.
• El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.
El programa debe ser capaz de responder a las siguientes consultas:
a) ¿Son rivales Argentina y Brasil?
b) ¿Cuáles son los rivales de un determinado equipo (por ejemplo
Holanda)?*/

grupo_pais(brasil,grupo1).
grupo_pais(espania,grupo1).
grupo_pais(jamaica,grupo1).
grupo_pais(italia,grupo1).
grupo_pais(argentina,grupo2).
grupo_pais(nigeria,grupo2).
grupo_pais(holanda,grupo2).
grupo_pais(escocia,grupo2).
son_rivales(Pais1,Pais2):-grupo_pais(Pais1,X),grupo_pais(Pais2,X),Pais1\=Pais2.