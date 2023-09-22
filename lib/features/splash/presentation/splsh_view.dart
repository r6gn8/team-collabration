import 'package:flutter/material.dart';
//import 'package:project_flutter/core/sconstants.dart';
import 'package:project_flutter/features/splash/presentation/widgets/splash_body.dart';

import '../../../core/constants.dart';
//import 'package:project_1/core/constants.dart';
//import 'package:project_1/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SplashViewBody(),
      //backgroundColor: kMainColor,
     // body: SplashViewBody(),
    );
  }
}
