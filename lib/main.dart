import 'package:flutter/material.dart';
import 'package:straussweb/src/routes/rutas.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: getRoutes(),
      
    );
  }
}