import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/core/utils/size_config.dart';
import 'package:the_project_flutter/features/on%20boarding/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  /// ANIMATION CONTROLLER
  late AnimationController _controller;
  /// ANIMATION
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    /// INITIALING THE CONTROLLER
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    /// INITIALING THE ANIMATION
    _animation= CurvedAnimation(parent: _controller, curve: Curves.fastEaseInToSlowEaseOut);
    /// STARTING THE ANIMATION
    _controller.forward();
    /// TIMER FOR SPLASH DURATION
    Timer( const Duration(seconds: 4),(){
      /// NAVIAGTING TO LOGIN SCREEN
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Onbording()));

    }

    );
}


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(

      backgroundColor: appbarGreen,
      body: ScaleTransition(
        scale: _animation,
      child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/Tree planted logo.png'),),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("Rose shop", style: GoogleFonts.pacifico(
              fontSize: 30,
            ),

            ),
          ],
        ),
      ) ,
      )
     ,
    );
  }
}
