import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/routes/rutas.dart';

Future<void> main() async {
 await Firebase.initializeApp();
  runApp(MyApp());
}

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
