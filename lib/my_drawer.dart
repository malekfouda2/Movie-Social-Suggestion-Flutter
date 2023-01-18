import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/account.dart';
import 'package:movies_app/contactus.dart';
import 'package:movies_app/navpages/main_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('homepage'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text('grid contact us'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const contactUs(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance),
              title: const Text('Account'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Account(),
                ));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.reviews),
            //   title: const Text('About'),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(MaterialPageRoute(
            //       builder: (context) => const About(),
            //     ));
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Prefrence'),
              onTap: () {},
            )
          ],
        ));
  }
}
