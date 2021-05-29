import 'package:flutter/material.dart';

double dimensionesEnAncho(BuildContext context, double mult ) {
  double width = MediaQuery.of(context).size.width;
  return (width*mult);
}

double dimensionesEnAlto(BuildContext context, double mult ) {
  double height = MediaQuery.of(context).size.height;
  return (height*mult);
}
