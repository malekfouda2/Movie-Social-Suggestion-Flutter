import 'package:flutter/material.dart';
import 'package:movies_app/navpages/movies.dart';
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
    return MaterialApp(
      title: 'Welcome',
      debugShowCheckedModeBanner: false, //bashyl elbuner eldaigonal dah
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const moviesPage(),
    );
  }
}
