import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imgUsers extends StatefulWidget {


 const imgUsers({Key?key}) :super(key: key);

   @override
  State<imgUsers> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<imgUsers> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('no');



  @override
  Widget build(BuildContext context) {
    CollectionReference userss = FirebaseFirestore.instance.collection('no');

    return FutureBuilder<DocumentSnapshot>(
      future: userss.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          // ${data['title']}
          return CircleAvatar(
            backgroundColor: Color(0xFFF1D1B8),
            radius: 64,
            backgroundImage: NetworkImage( data["imgLink"]),
          );
        }
        return Text("loading");
      },
    );
  }
}
