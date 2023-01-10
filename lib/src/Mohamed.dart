import 'package:flutter/material.dart';
import 'package:index/navpages/home.dart';
import 'package:index/src/LoginSceen.dart';


final NameController = TextEditingController();
final EmailController = TextEditingController();
final PasswordController = TextEditingController();
final dateController = TextEditingController();

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

Container? signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },

          // ignore: sort_child_properties_last
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black26;
                }
                return Colors.white;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))));
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  Future createUser({
    required String name,
    required String email,
    required String date,
  }) async {
   // final userInsatnce = FirebaseFirestore.instance.collection('users').doc();

    final userData = {
      'name': name,
      'email': email,
      'Date of birth': date,
      'profile picture ': "",
    };

   // await userInsatnce.set(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(height: 20.0),
                const SizedBox(height: 150),
                Image.asset('assets/images/app_logo.png',
                    width: 170, height: 170),
                Container(
                  padding: EdgeInsets.fromLTRB(35.0, 140.0, 0.0, 0.0),
                  child: Text('SignUp',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Container(
                key: formKey,
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: NameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter correct name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0XFFD3D3D3),
                          hintText: 'Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: EmailController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^(?=.*?[@])');
                        if (value!.isEmpty) {
                          return 'Please enter a email';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid mail includes @';
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0XFFD3D3D3),
                          hintText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: PasswordController,
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])');
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Please enter valid password';
                          } else {
                            return null;
                          }
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0XFFD3D3D3),
                          hintText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    TextFormField(
                      controller: dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0XFFD3D3D3),
                          hintText: 'Date of birth',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(height: 20.0),
                    // SignInSignUpButton(
                    //     isLogin: false,
                    //     onTap: () {
                    //       FirebaseAuth.instance
                    //           .createUserWithEmailAndPassword(
                    //               email: EmailController.text,
                    //               password: PasswordController.text)
                    //           .then((value) {
                    //         createUser(
                    //             name: NameController.text,
                    //             email: EmailController.text,
                    //             date: dateController.text);
                    //         // ignore: avoid_print
                    //         print("Created New Account");
                    //         context.go('/');
                    //       }).onError((error, stackTrace) {
                    //         // ignore: avoid_print
                    //         print("Error ${error.toString()}");
                    //       });
                    //     }),
                    SizedBox(height: 20.0),
                    Center(
                      child: InkWell(
                        child: Text(
                          'SignUp With Google Account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 52, 78, 65),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        )));
  }
}
