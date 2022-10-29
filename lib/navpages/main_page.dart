import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:index/navpages/add_movies.dart';
import 'package:index/navpages/home.dart';
import 'package:index/navpages/movies.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), moviesPage(), addMoviesPage()];

  void onTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_max), label: 'Home'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.movie_creation_outlined), label: 'Movies'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add), label: 'Add Movie')
        ],
      ),
    );
  }
}
