import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      floatingActionButton: _floatingButton(),
      body: StreamBuilder<User>(
          stream: auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.uid);
              return _streamMyPost(snapshot.data.uid);
            } else {
              return Center(
                  child: Container(
                child: Text('Primero inicia tu cuenta'),
              ));
            }
          }),
    );
  }

  Widget _streamMyPost(String id) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('mypost').doc(id).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: _usersStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return Center(child: Text('Ya puedes comenzar a hacer tu perfil'));
          }
          return Center(
            child: Text(snapshot.data.data().toString()),
          );
        });
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
