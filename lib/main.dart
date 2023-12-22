import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/data/provider/google_signin.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/home.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/register.dart';
import 'package:the_project_flutter/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_project_flutter/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'core/utils/ snackbar.dart';
import 'features/Auth/presentation/pages/bay.dart';
import 'features/Auth/presentation/pages/checkout.dart';
import 'features/Auth/presentation/pages/details_screen.dart';
import 'features/Auth/presentation/pages/login/login.dart';
import 'features/Auth/presentation/pages/login/verify_email.dart';
import 'features/Auth/presentation/pages/theme.dart';
import 'features/on boarding/on_boarding.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Cart();
        }),
        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
        //theme: ThemeData.dark(),
          title: "myApp",
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                return Home(); // home() OR verify email
              } else {
                return Login();
              }
            },
          )
      ),
    );
  }
}
