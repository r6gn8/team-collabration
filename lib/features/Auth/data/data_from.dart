import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestore extends StatefulWidget {
  final String documentId;

  GetDataFromFirestore({required this.documentId});

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  final userController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('no');

  MyShowDialog(Map data,dynamic mykey) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: EdgeInsets.all(22),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: userController,
                    maxLength: 20,
                    decoration:
                        InputDecoration(hintText: "${data[mykey]}")),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          users
                              .doc(credential!.uid)
                              .update({mykey: userController.text});
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 17),
                        )),
                    TextButton(
                        onPressed: () { Navigator.pop(context);},
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 17),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference userss = FirebaseFirestore.instance.collection('no');

    return FutureBuilder<DocumentSnapshot>(
      future: userss.doc(widget.documentId).get(),
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Username: ${data['username']} ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            MyShowDialog(data,'username');
                          },
                          icon: Icon(Icons.edit)
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              users.doc(credential!.uid).update({"username": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 22,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Age: ${data['age']} ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            MyShowDialog(data,'age');
                          },
                          icon: Icon(Icons.edit)
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              users.doc(credential!.uid).update({"age": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 22,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "password: ${data['pass']} ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            MyShowDialog(data,'pass');
                          },
                          icon: Icon(Icons.edit)
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              users.doc(credential!.uid).update({"pass": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 22,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Job: ${data['title']} ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            MyShowDialog(data,'title');
                          },
                          icon: Icon(Icons.edit)
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              users.doc(credential!.uid).update({"title": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 22,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email: ${data['email']} ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            MyShowDialog(data,'email');
                          },
                          icon: Icon(Icons.edit)
                      ),

                      IconButton(
                          onPressed: () {
                            setState(() {
                              users.doc(credential!.uid).update({"email": FieldValue.delete()});
                            });
                          },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 22,
              ),

              Center(
                child: TextButton(
                    onPressed: ()
                    {
                      setState(() {
                        users.doc(credential!.uid).delete();
                      });
                    },
                    child:Text("Delete Data",style: TextStyle(fontSize: 18),)
                ),
              )
            ],
          );
        }
        return Text("loading");
      },
    );
  }
}
