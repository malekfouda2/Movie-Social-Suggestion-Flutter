import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/src/LoginSceen.dart';
import 'package:movies_app/widgets/appbar_widget.dart';
import 'package:movies_app/widgets/profile_widget.dart';
//import 'package:user_profile_example/utils/user_preferences.dart'; //file that has the info that is going to get displayed which should be replaced by the firebase
import 'models/userModel.dart'; //class of the user
import 'my_drawer.dart';
import 'package:firebase_core/firebase_core.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  String? name = '';
    String? email = '';
      String? gender = '';
  String? dob = '';
  String? country = '';
  String? image = '';
 // File? imageXFile;
Future<String> getUserId() async {
  List<String> userId = [];
  await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .limit(1)
      .get()
      .then(
        (snapShot) => snapShot.docs.forEach((user) {
          userId.add(user.id);
        }),
      );

  return userId[0];
}
Future _getDataFromDatabase() async
{
 String currentUser = await getUserId();
  await FirebaseFirestore.instance.collection("users")
  .doc(currentUser)
  .get()
  .then((snapshot) async
{
if (snapshot.exists){
  setState((){
    // print(snapshot.data()!["name"]);
  name =snapshot.data()!["name"];
   email = snapshot.data()!["email"];
  gender = snapshot.data()!["gender"];
  dob = snapshot.data()!["dob"];
 //image = snapshot.data()!["image"];
  
});
}
});
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           drawer: const MyDrawer(),

   
      appBar: buildAppBar(context),
      body: Container(
        child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
children: [
  // GestureDetector(
  //   onTap: () {
  //     // show image dialog
  //   },
  //   child: CircleAvatar(
  //     backgroundColor: Colors.white,
  //     minRadius: 55.0,
  //     child: CircleAvatar(
  //       minRadius: 50.0,
  //       backgroundImage: imageXFile == null
  //     ?
  //     NetworkImage(
  //       image!
  //     )
  //     :
  //     Image.file(imageXFile!).image
  //     ),
  //   ),
    
  // ),
  SizedBox(height: 10,),
  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Name : ' + name!
      ),
      IconButton(onPressed: ()
      {


      },
      icon: const Icon(Icons.edit),
      ),
    ],
  ),
    SizedBox(height: 10,),
    Text(
        'email : ' + email!
      ),
      IconButton(onPressed: ()
      {


      },
      icon: const Icon(Icons.edit),
      ),
    
SizedBox(height: 10,),
    Text(
        'gender : ' + gender!
      ),
     
SizedBox(height: 10,),
    Text(
        'date of birth : ' + dob!
      ),
     
     
SizedBox(height: 10,),
   
  MaterialButton(
                    color: Color.fromARGB(255, 82, 79, 77),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                    child: const Text(
                      'Sign out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            50)), //el button elborder mdawar

                    onPressed: () { 
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                    }
                    )
],
        ),
      )
    );
  }

}