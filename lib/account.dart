// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:movies_app/widgets/appbar_widget.dart';
// import 'package:movies_app/widgets/profile_widget.dart';
// import 'package:user_profile_example/utils/user_preferences.dart'; //file that has the info that is going to get displayed which should be replaced by the firebase
// import 'models/userModel.dart'; //class of the user


// import 'my_drawer.dart';

// class Account extends StatelessWidget {
//   const Account({super.key});

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
// >>>>>>> d183049b5e2f7ff4c33c25cc21894bc0a4f2e386

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//            drawer: const MyDrawer(),

//     final user = UserPreferences.myUser;

//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfileWidget(
//             imagePath: user.imagePath,
//             onClicked: () async {},
//           ),
//           const SizedBox(height: 24),
//           buildName(user),
//           const SizedBox(height: 48),
//           buildAbout(user),
//         ],
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(
//             user.name,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           ),
//           Text(
//             user.DOB,
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       );

//   Widget buildAbout(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Reviews',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       );
// }
