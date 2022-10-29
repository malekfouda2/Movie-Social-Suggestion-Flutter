import 'package:flutter/material.dart';
import 'package:index/src/LoginSceen.dart';
import 'package:index/account.dart';
import 'package:index/contactus.dart';
import 'package:index/navpages/main_page.dart';
import 'src/LoginSceen.dart';
import 'my_drawer_header.dart';
//import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      debugShowCheckedModeBanner: false, //bashyl elbuner eldaigonal dah
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
