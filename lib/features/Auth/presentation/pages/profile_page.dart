// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:the_project_flutter/features/Auth/data/data_from.dart';
import '../../../../core/widgets/user_img.dart';
import 'package:path/path.dart' show basename;


class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final credential = FirebaseAuth.instance.currentUser;
  File? imgPath;
  String? imgName;
  CollectionReference users = FirebaseFirestore.instance.collection('no');


  uploadImage2Screen() async {
    final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: Text(
              "logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xFFF1D1B8).withOpacity(0.7),
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Color(0xFFDCC6B5),
                    color: Colors.grey,

                  ),
                  child: Stack(
                    children: [

                      imgPath==null
                          ? imgUsers()
                          : ClipOval(
                          child: Image.file(
                            imgPath!,
                            width: 145,
                            height: 145,
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                        left: 95,
                        bottom: -3,
                        child: IconButton(
                            onPressed: () async {
                             await uploadImage2Screen();
                             if(imgPath !=null){
                               final storageRef = FirebaseStorage.instance.ref("user-img/$imgName");
                               await storageRef.putFile(imgPath!);
                               String url = await storageRef.getDownloadURL();
                               users.doc(credential!.uid).update({"imgLink": url,});
                             }
                            },
                            icon: const Icon(Icons.add_a_photo),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                    color: Color(0xFFDCC6B5),
                    borderRadius: BorderRadius.circular(11)),
                child: Text(
                  "Info from firebase Auth",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Email:    ${credential!.email}   ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Created date:   ${DateFormat("MMM d,y").format( credential!.metadata.creationTime!) }   ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Last Signed In:  ${DateFormat("MMM d,y").format( credential!.metadata.lastSignInTime!) }  ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),

              Center(
                child: TextButton(
                    onPressed: ()
                    {
                      // credential!.delete();
                      credential!.delete();
                     Navigator.pop(context);
                    },
                    child:Text("Delete User",style: TextStyle(fontSize: 18),)
                ),
              ),

              SizedBox(
                height: 22,
              ),

              Center(
                  child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color: Color(0xFFDCC6B5),
                          borderRadius: BorderRadius.circular(11)),
                      child: Text(
                        "Info from firebase firestore",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),


              GetDataFromFirestore(documentId: credential!.uid)
            ],
          ),
        ),
      ),
    );
  }
}
