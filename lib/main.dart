import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/bay.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/checkout.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/home.dart';
import 'package:the_project_flutter/features/splash/presentation/widgets/splash_body.dart';
import 'package:the_project_flutter/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'locale/locale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:Get.deviceLocale,
      fallbackLocale:Locale('en'),
      translations: MyLocale(),
      // getPages: [
      //   GetPage(name: "/", page: () => Home())
      // ],


      home: ChangeNotifierProvider(
        create: (context) {return Cart();},
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),


          ),
      ),
    );
  }
}
