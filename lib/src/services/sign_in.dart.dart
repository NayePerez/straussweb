/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInStrauss {
  final _googleSignIn = GoogleSignIn();

  bool _iniciandoSesion;

  SignInStrauss() {
    _iniciandoSesion = false;
  }

  bool get getiniciandoSesion => _iniciandoSesion;

  set iniciandoSesion(bool iniciandoSesion) {
    _iniciandoSesion = iniciandoSesion;
  }

  Future googleLogin() async {
    final GoogleSignInAccount user = await _googleSignIn.signIn();

    if (user == null) {
      iniciandoSesion = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);

      iniciandoSesion = true;
    }
  }

  Future loginStrauss(correo, contrasena) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: correo, password: contrasena);
    iniciandoSesion = true;
  }

  void logout() async {
    FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
    iniciandoSesion = false;
  }
}*/
