import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =FirebaseFirestore.instance.collection('usuarios').snapshots();
    return Scaffold(
          body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ListTile(
                  title: Center(child: new Text(document.data().toString())),
                 
                );
              }).toList(),
            );
          }),
    );
  }
}
