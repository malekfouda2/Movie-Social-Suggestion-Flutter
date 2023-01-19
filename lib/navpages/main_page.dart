import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:get/get.dart';
import 'package:movies_app/navpages/homeJoe.dart';
import '../controllers/bottom_navigator_controller.dart';
import '../my_drawer.dart';
import 'watchListScreen.dart';
import 'search.dart';
import '../account.dart';
import '../contactus.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
  List pages = [
    HomeScreen(),
    SearchScreen(),
    WatchList(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
 final BottomNavigatorController controller = Get.put(BottomNavigatorController());
  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies "),
                  backgroundColor: Color(0xFF242A32),
    
        ),
        body: SafeArea(
          child:IndexedStack(
            index: controller.index.value,
            children: Get.find<BottomNavigatorController>().screens,
            )
           ),
        bottomNavigationBar: Container(
            height: 78,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFF0296E5),
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (index) =>
                  Get.find<BottomNavigatorController>().setIndex(index),
              backgroundColor: const Color(0xFF242A32),
              selectedItemColor: const Color(0xFF0296E5),
              unselectedItemColor: const Color(0xFF67686D),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: const Icon(Icons.home_max)
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: const Icon(Icons.search),
                  ),
                  label: 'Search',
                  tooltip: 'Search Movies',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: const Icon(Icons.watch_later_outlined),
                  ),
                  label: 'Watch list',
                  tooltip: 'Your WatchList',
                ),
              ],
            ),
          ),
        
        drawer: const MyDrawer()
      ),
    ));
  }
  }


