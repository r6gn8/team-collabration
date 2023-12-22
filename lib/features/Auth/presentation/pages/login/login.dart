import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/widgets/feild.dart';
import 'package:the_project_flutter/features/Auth/data/provider/google_signin.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/home.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/register.dart';

import '../../../../../core/utils/ snackbar.dart';
import '../../../../../core/widgets/text.dart';
import 'forgot_passowrd.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Login extends StatefulWidget {
   Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emaillController = TextEditingController();
  final passworrdController = TextEditingController();
  bool isVisable =false;

  signIn() async{

    showDialog(
        context: context,
        builder: (context){
          return Center(
            child: CircularProgressIndicator(
                color: Colors.white
            ),
          );

        });

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emaillController.text,
          password: passworrdController.text,);

    //  showSnackBar( context ,  "Done");

    } on FirebaseAuthException catch (e) {

        showSnackBar( context ,  "ERROR : ${e.code}....");

    }

    //stop indicator
    Navigator.pop(context);
  }


  @override
  void dispose() {
    emaillController.dispose();
    passworrdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);

    return  Scaffold(
      // backgroundColor: Color.fromARGB(255, 76, 141, 95),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Center(
                  //   child: Hero(
                  //     tag: "logo",
                  //     child: SizedBox(
                  //         height: 130,
                  //         width: 130,
                  //         child: Image.asset("assets/images/Tree planted logo.png")),
                  //   ),
                  // ),


                  TextField(
                    controller: emaillController,
                    style:  TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decoratiomText.copyWith(hintText: "E-mail",
                      suffixIcon: Icon(Icons.email_outlined,color: Colors.black),
                    ),
                  ),

                  const  SizedBox(height: 33),

                  TextField(
                    controller: passworrdController,
                    style:  TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.text,
                    obscureText: isVisable? false : true,
                    decoration: decoratiomText.copyWith(hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed :(){
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable? Icon(Icons.visibility) : Icon(Icons.visibility_off),color: Colors.black,
                      ),

                    ),
                  ),




                  const  SizedBox(height: 25,),
                 TextButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ForgotPassword()),
                       );

                     },
                     child: Text("Forget Password?",
                     style: TextStyle(
                       fontSize: 18,
                         color: Colors.black,
                         decoration: TextDecoration.underline
                     )
                     ),
                 ),

                  const  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () async{
                     FocusManager.instance.primaryFocus?.unfocus();
                    await  signIn();
                    },

                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: TextUtil(text: "Log in",weight: true,color: Colors.white,size: 16,),
                    ),
                  ),

                  const  SizedBox(height: 25,),
                  RichText(
                    text: TextSpan(
                      text: 'Not a member? ',
                      style:  TextStyle(color: Colors.black,fontSize: 14),
                      children:  <TextSpan>[
                        TextSpan(text: 'Join now', style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                          );


                        },
                        ),

                      ],
                    ),
                  ),


                  SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    width: 299,
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.black,
                            )),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.symmetric(vertical: 27),
                    child: GestureDetector(
                      onTap: (){

                        googleSignInProvider.googlelogin() ;
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                            Border.all(color: Colors.black, width: 1)),
                        child: SvgPicture.asset(
                          "assets/icons/google.svg",
                          color: Colors.black,
                          height: 27,
                        ),
                      ),
                    ),
            ),

            // Positioned(
            //     bottom: 0,
            //     child: Transform.rotate(
            //         angle: 6,
            //         child:const Icon(Icons.add_shopping_cart_outlined,size: 100,color: Colors.black12,)
            //     )
            // ),

          ],
        ),
      ),
]
          )
        ),

      appBar: AppBar(
        backgroundColor: Color(0xFFF1D1B8).withOpacity(0.7),
        title: Text("LOGIN"),

        actions: [




        ],

      ),



    );


  }
}
