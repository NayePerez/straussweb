import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/utils/colors_utils.dart';

BoxDecoration decorationBorderContianet(Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
            spreadRadius: 10.0)
      ]);
}
BoxDecoration fondoDegradado() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
    azul(), //Azul
    azulOscuro(), //Azul Oscuro
    azulOscuro() //AzulOscuro
  ], stops: [
    0.2,
    0.58,
    0.7
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter));
}

BoxDecoration fondoDegrdado2() {
  return BoxDecoration(
       gradient: LinearGradient(colors: [
    azul(), //Azul
    azulOscuro(), //Azul Oscuro
    azulOscuro() //AzulOscuro
  ], stops: [
    0.2,
    0.58,
    0.7
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter),
      borderRadius: BorderRadius.circular(30),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
            spreadRadius: 10.0)
      ]);
}