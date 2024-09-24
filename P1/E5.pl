% auto(patente,propietario)
auto(hti687,pedro).
auto(jug144,juan).
auto(gqm758,pedro).
auto(lod445,carlos).
auto(lfz569,miguel).
auto(axk798,maria).
% deuda(patente, monto adeudado)
deuda(lfz569,2000).
deuda(gqm758,15000).
deuda(axk798,1000).

esDeudor(X):-auto(Pat,X), deuda(Pat,_).

/*En la terminal ejecutamos:
esDeudor(pedro).
esDeudor(_).
esDeudor(X).

*/