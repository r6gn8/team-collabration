import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:the_project_flutter/core/utils/appbar.dart';
import 'package:the_project_flutter/core/widgets/feild.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/login.dart';
import '../../../../../core/utils/ snackbar.dart';
import '../../../../../core/widgets/text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' show basename;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  bool isVisable = true;
  File? imgPath;
  String? imgName;
  

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final jobController = TextEditingController();

  bool isPasswordChar = false;
  bool ispasswordHasNumber = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  //ImageSource.camera

  uploadImage2Screen(ImageSource camgar) async {
    final pickedImg = await ImagePicker().pickImage(source: camgar);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
           imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
           print(imgName);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
    if (!mounted) return;
    Navigator.pop(context);
  }

  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(22),
          //  color: Color(0xFFF1D1B8),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    Text(
                      " From Camera",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage2Screen(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(Icons.photo),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 22),
                  ))
            ],
          ),
        );
      },
      //  isScrollControlled: true
    );
  }

  onPasswordChanged(String password) {
    isPasswordChar = false;
    ispasswordHasNumber = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPasswordChar = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        ispasswordHasNumber = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Upload image to firebase storage
      final storageRef = FirebaseStorage.instance.ref("user-img/$imgName");
      await storageRef.putFile(imgPath!);
      String url = await storageRef.getDownloadURL();

      CollectionReference users = FirebaseFirestore.instance.collection('no');

      users
          .doc(credential.user!.uid)
          .set({
            'imgLink': url,
            'username': usernameController.text,
            'age': ageController.text,
            "title": jobController.text,
            "email": emailController.text,
            "pass": passwordController.text,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The account already exists for that email.");
      } else {
        showSnackBar(context, "ERROR -Please try again late");
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    ageController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 76, 141, 95),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Color(0xFFDCC6B5),
                        color: Colors.grey,
                      ),
                      child: Stack(
                        children: [
                          imgPath == null
                              ? CircleAvatar(
                                  backgroundColor: Color(0xFFF1D1B8),
                                  radius: 64,
                                  backgroundImage: AssetImage(
                                      "assets/images/User común aesthetic.jpeg"),
                                )
                              : ClipOval(
                                  child: Image.file(
                                  imgPath!,
                                  width: 145,
                                  height: 145,
                                  fit: BoxFit.cover,
                                )),
                          Positioned(
                            left: 99,
                            bottom: -3,
                            child: IconButton(
                                onPressed: ()
                                {
                                  showmodel();
                                },
                                icon: const Icon(Icons.add_a_photo)),
                          ),
                        ],
                      ),
                    ),

                    // Center(
                    //   child: Hero(
                    //     tag: "logo",
                    //     child: SizedBox(
                    //         height: 130,
                    //         width: 130,
                    //         child: Image.asset("assets/images/Tree planted logo.png")),
                    //   ),
                    // ),
                    // const  SizedBox(height: 20,),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: usernameController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      decoration: decoratiomText.copyWith(
                        hintText: "UserName",
                        suffixIcon: Icon(Icons.person, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 33),

                    TextFormField(
                      controller: ageController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: decoratiomText.copyWith(
                        hintText: "Age",
                        suffixIcon: Icon(Icons.pest_control_rodent,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 33),

                    TextFormField(
                      controller: jobController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      decoration: decoratiomText.copyWith(
                        hintText: "Job",
                        suffixIcon: Icon(Icons.work, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 33),

                    TextFormField(
                      validator: (value) {
                        return value!.contains(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? null
                            : "Enter a valid email";
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      decoration: decoratiomText.copyWith(
                        hintText: "E-mail",
                        suffixIcon: Icon(Icons.email, color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 33),

                    TextFormField(
                      onChanged: (password) {
                        onPasswordChanged(password);
                      },
                      validator: (value) {
                        return value!.length < 8
                            ? "Enter a valid password"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.text,
                      obscureText: isVisable ? true : false,
                      decoration: decoratiomText.copyWith(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: isVisable
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color:
                                  isPasswordChar ? Colors.black : Colors.white),
                          height: 20,
                          width: 20,
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "At least 8 characters",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: ispasswordHasNumber
                                  ? Colors.black
                                  : Colors.white),
                          height: 20,
                          width: 20,
                          child:
                              Icon(Icons.check, size: 16, color: Colors.white),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "At least 1 number",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color:
                                  hasUppercase ? Colors.black : Colors.white),
                          height: 20,
                          width: 20,
                          child:
                              Icon(Icons.check, size: 16, color: Colors.white),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "Has Uppercase",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color:
                                  hasLowercase ? Colors.black : Colors.white),
                          height: 20,
                          width: 20,
                          child:
                              Icon(Icons.check, size: 16, color: Colors.white),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "Has  Lowercase",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              color: hasSpecialCharacters
                                  ? Colors.black
                                  : Colors.white),
                          height: 20,
                          width: 20,
                          child:
                              Icon(Icons.check, size: 16, color: Colors.white),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          "Has  Special Characters",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),

                    // const  SizedBox(height: 20,),
                    //TextField(keyboardType: TextInputType.text,),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()  && imgName !=null  && imgPath !=null) {
                          await register();
                          if (!mounted) return;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        } else {
                          showSnackBar(context, "ERROR");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                "Sign up ",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    RichText(
                      text: TextSpan(
                        text: 'I am a member? ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //     bottom: 0,
            //     child: Transform.rotate(
            //         angle: 6,
            //         child: const Icon(
            //           Icons.add_shopping_cart_outlined,
            //           size: 100,
            //           color: Colors.black12,
            //         ))),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1D1B8).withOpacity(0.7),
        title: Text("REGISTER"),
        actions: [],
      ),
    );
  }
}
