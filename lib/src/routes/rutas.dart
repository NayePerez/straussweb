import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/login_page.dart';
import 'package:straussweb/src/pages/register_page.dart';


Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
 "login" : (BuildContext context) => LoginPage(),
 "register":  (BuildContext context) => RegisterPage(),
  };
}
