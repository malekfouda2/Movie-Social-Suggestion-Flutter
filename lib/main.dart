import 'package:contactus/contactus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies_app/navpages/homeJoe.dart';
import 'package:contactus/contactus.dart';

import 'package:movies_app/src/SignUp.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../src/LoginSceen.dart';
import '../account.dart';
import '../contactus.dart';
import '../navpages/main_page.dart';
//import 'LoginSceen.dart';
import 'src/LoginSceen.dart';
import 'navpagesadmin/main_pageadmin.dart';
import 'package:movies_app/navpages/search.dart';
//import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD7q1mpLiq-ZP9dDHRhC1Y-cN5EJP96wdE",
          appId: "1:352259150436:android:431d22b33b4424242c8571",
          messagingSenderId: "",
          projectId: "moviesuggestion-32aef",
          databaseURL:
              'https://moviesuggestion-32aef-default-rtdb.firebaseio.com',
          storageBucket: 'moviesuggestion-32aef.appspot.com'));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF242A32),
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //bashyl elbuner eldaigonal dah

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF242A32),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home:  MainPage(),
    );
  }
}
