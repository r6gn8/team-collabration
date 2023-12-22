import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/login.dart';

import '../../../../../core/utils/ snackbar.dart';
import '../../../../../core/widgets/feild.dart';

class ForgotPassword extends StatefulWidget {
   ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  bool isLoading =false;
  final _formKey = GlobalKey<FormState>();


  resetPassword() async{

    showDialog(
        context: context,
        builder: (context){
          return Center(
            child: CircularProgressIndicator(
                color: Colors.white
            ),
          );

        });

    try{

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );


    }  on FirebaseAuthException catch (e) {
      showSnackBar( context ,  "ERROR : ${e.code}");
    }


   // Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );

  }

   @override
   void dispose() {
     emailController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFDCC6B5),
    title: Text("Reset Password"),
        ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Entr your password" ,style: TextStyle(fontSize: 18),
                ),
                SizedBox(
              height: 33,
      ),
                TextFormField(
                  validator: (value) {
                    return value!.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))?null : "Enter a valid email" ;},

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  style:  TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decoratiomText.copyWith(
                    hintText: "E-mail",
                    suffixIcon: Icon(Icons.email_outlined,color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 33,
                ),


                GestureDetector(
                  onTap: () async {
                    //تاكد من كنابه الايميل
                    if(_formKey.currentState!.validate()){
                      resetPassword( );
                    }else{
                     showSnackBar( context,  "ERROR");
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFDCC6B5),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    alignment: Alignment.center,
                    child: isLoading? CircularProgressIndicator(color: Colors.white): Text("Reset Password ",style: TextStyle(color: Colors.white),),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
