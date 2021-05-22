/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/home_page.dart';


class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.data != null) {
            return HomePage();
          } else {
            return Center(
              child: Scaffold(
                 
                  body: Center(child: CircularProgressIndicator())),
            );
          }
        });
  }
}*/
