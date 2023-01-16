import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:movies_app/navpages/homeJoe.dart';
import '../navpages/add_movies.dart';
import '../navpages/movies.dart';
import '../account.dart';
import '../contactus.dart';
import '../my_drawer_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage = DrawerSections.HomeScreen;
  List pages = [
    HomeScreen(),
    moviesPage(),
    add_movies(),
    
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies "),
                backgroundColor: Color(0xFF242A32),

      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF242A32),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white.withOpacity(0.5),
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
      
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Account", Icons.account_box,
<<<<<<< HEAD
              currentPage == DrawerSections.HomeScreen ? true : false),
          menuItem(2, "Contact Us", Icons.people_alt_outlined,
=======
              currentPage == DrawerSections.HomePage ? true : false),
          menuItem(2, " Logout", Icons.logout,
>>>>>>> 3d3a14cdcbaa27bb5ecfae692f8e1c949b3ae9f8
              currentPage == DrawerSections.contactus ? true : false),
          menuItem(3, "Home", Icons.home,
              currentPage == DrawerSections.Account ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.HomeScreen;
            } else if (id == 2) {
              currentPage = DrawerSections.contactus;
            } else if (id == 3) {
              currentPage = DrawerSections.Account;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  HomeScreen,
  contactus,
  Account,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
