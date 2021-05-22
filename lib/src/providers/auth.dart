import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthProvider{
  User _user;
  Stream<User> _status;
  

  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
//  getter


  AuthProvider.init() {
    _fireSetUp();
  }

  _fireSetUp() async {
    await Firebase.initializeApp().then((value) {
      auth.authStateChanges().listen(_onStateChanged);
    });
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
   await auth.signOut();
    _status = auth.authStateChanges();
  }

  _onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = auth.authStateChanges();
    } else {
      _user = firebaseUser;
      Future.delayed(const Duration(seconds: 2), () {
        _status = auth.authStateChanges();
      });
    }
  }
}
