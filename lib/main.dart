import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/SignUp.dart';
import '../src/LoginSceen.dart';
import '../account.dart';
import '../contactus.dart';
import '../navpages/main_page.dart';
//import 'LoginSceen.dart';
import 'src/LoginSceen.dart';
import 'navpagesadmin/main_pageadmin.dart';
import 'my_drawer_header.dart';
//import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
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
    return MaterialApp(
      title: 'Welcome',
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
      home: const SignUp(),
    );
  }
}
