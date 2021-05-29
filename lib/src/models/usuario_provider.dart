import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioProvider {
  Future login(
      String nombre, String email, String password, String date) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    /*final resp = await http.post(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print(decodedResp);

    if ( decodedResp.containsKey('idToken') ) {
      
      _prefs.token = decodedResp['idToken'];

      return { 'ok': true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok': false, 'mensaje': decodedResp['error']['message'] };
    }*/
  }

  Future register(
      String nombre, String email, String password, String date) async {
    User usuario = FirebaseAuth.instance.currentUser;
    final _db = FirebaseFirestore.instance;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    DocumentReference userRef = _db.collection('usuarios').doc(usuario.uid);

    userRef.set(
      {
        'uid': usuario.uid,
        'displayName': nombre,
        'email': email,
        'lastSign': date,
      },
    );
  }

  /*final resp = await http.post(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print(decodedResp);

    if ( decodedResp.containsKey('idToken') ) {
      
      _prefs.token = decodedResp['idToken'];

      return { 'ok': true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok': false, 'mensaje': decodedResp['error']['message'] };
    }


  }*/
}
