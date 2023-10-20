import 'package:flutter/material.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/features/splash/presentation/widgets/splash_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SplashScreen(),

    );
  }
}
