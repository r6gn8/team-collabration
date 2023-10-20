import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_project_flutter/core/widgets/feild.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/login.dart';

import '../../../../../core/widgets/text.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 141, 95),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Hero(
                      tag: "logo",
                      child: SizedBox(
                          height: 130,
                          width: 130,
                          child: Image.asset("assets/images/Tree planted logo.png")),
                    ),
                  ),
                  Field(controller: _nameController, hinttext: "6".tr, icon: Icons.account_circle_sharp,),
                  const  SizedBox(height: 20,),
                  Field(controller: _emailController, hinttext: "7".tr, icon: Icons.alternate_email,),
                  const  SizedBox(height: 20,),
                  Field(controller: _passwordController, hinttext: "8".tr, icon: Icons.lock,),
                  const  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: (){

                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  Login()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: TextUtil(text:"13".tr,weight: true,color: Colors.white,size: 16,),
                    ),
                  ),
                  const  SizedBox(height: 25,),
                  RichText(
                    text: TextSpan(
                      text: '14'.tr,
                      style:  TextStyle(color: Colors.white,fontSize: 14),
                      children:  <TextSpan>[
                        TextSpan(text: '15'.tr, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );


                        },
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
                bottom: 0,
                child: Transform.rotate(
                    angle: 6,
                    child:const Icon(Icons.add_shopping_cart_outlined,size: 100,color: Colors.black12,)
                )
            ),

          ],
        ),
      ),

    );


  }
}
