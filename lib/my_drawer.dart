import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:movies_app/account.dart';
import 'package:movies_app/contactUs.dart';

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
              leading: const Icon(Icons.home,  color: Colors.black,),
              title: const Text('homepage' , style: TextStyle(color: Colors.black),
                    ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone, color: Colors.black,),
              title: const Text('grid contact us' , style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const contactUs(),
                ));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.account_balance ,  color: Colors.black,),
            //   title: const Text('Account' , style: TextStyle(color: Colors.black),),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(MaterialPageRoute(
            //       builder: (context) => const Account(),
            //     ));
            //   },
            // ),
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
              leading: const Icon(Icons.settings ,  color: Colors.black,),
              title: const Text('Prefrence' , style: TextStyle(color: Colors.black),),
              onTap: () {},
            )
          ],
        ));
  }
}
