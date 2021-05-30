import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioProvider {
  Future login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return {'ok': true};
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return {'ok': false, 'mensaje': e.message};
    }
  }

  Future register(String nombre, String email, String password, String date) async {
        FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
       
    await auth.currentUser.updateProfile(displayName: nombre, photoURL: null);
      DocumentReference userRef = FirebaseFirestore.instance.collection('usuarios').doc();

      userRef.set(
        {
          'id': userRef.id,
          'displayName': nombre,
          'email': email,
          'lastSign': date,
        },
      );
      return {'ok': true};
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return {'ok': false, 'mensaje': e.message};
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
