import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/my_drawer.dart';
import 'my_drawer.dart';
import 'package:contactus/contactus.dart';

class contactUs extends StatelessWidget {
  const contactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: ContactUs(
          
            cardColor: Colors.teal.shade100,
            textColor: Colors.teal.shade900,
           // logo: AssetImage('images/logo.jpg'),
            email: 'Mohameddelgendyy@gmail.com',
            companyName: 'Movie Rating',
            companyColor: Colors.white,
            dividerThickness: 2,
            phoneNumber: '+201097543403',
          
            taglineColor: Colors.white,
           // twitterHandle: 'AbhishekDoshi26',
           // instagram: '_abhishek_doshi',
            facebookHandle: 'MohamedElgendy'),
           drawer: const MyDrawer(),

    );
  }
}
