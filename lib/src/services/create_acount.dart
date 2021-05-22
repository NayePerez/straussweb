
/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAcount {
  final _db = FirebaseFirestore.instance;

  Future createAcount(email, password, String nombre) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User usuario = FirebaseAuth.instance.currentUser;
    usuario.updateProfile(displayName: nombre);
    await updateUserData(usuario);
  }

  Future<DocumentSnapshot> updateUserData(User user) async {
    DocumentReference userRef = _db.collection('usuarios').doc(user.uid);

    userRef.set(
      {
        'uid': user.uid,
        'email': user.email,
        'lastSign': DateTime.now(),
        'photoURL': user.photoURL,
        'displayName': user.displayName,
      },
    );

    DocumentSnapshot userData = await userRef.get();
    return userData;
  }

  void logout() async {
    FirebaseAuth.instance.signOut();
  }
}
*/