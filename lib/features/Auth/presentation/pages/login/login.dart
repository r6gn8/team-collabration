import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_project_flutter/core/widgets/feild.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/home.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/register.dart';

import '../../../../../core/widgets/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
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
                  Field(controller: _emailController, hinttext: "7".tr, icon: Icons.alternate_email,),
                    SizedBox(height: 20,),
                  Field(controller: _passwordController, hinttext: "8".tr, icon: Icons.lock,),
                  const  SizedBox(height: 25,),
                  Center(child: TextUtil(text: "9".tr,color: Colors.white,weight: true,size: 14,)),
                  const  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  Home()));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: TextUtil(text: "10".tr,weight: true,color: Colors.white,size: 16,),
                    ),
                  ),
                  const  SizedBox(height: 25,),
                  RichText(
                    text: TextSpan(
                      text: '11'.tr,
                      style:  TextStyle(color: Colors.white,fontSize: 14),
                      children:  <TextSpan>[
                        TextSpan(text: '12'.tr, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
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
