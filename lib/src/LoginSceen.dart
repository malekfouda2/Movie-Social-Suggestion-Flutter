import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/navpages/main_page.dart';
import '../src/ForgetPassword.dart';
import '../src/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found");
        final snackBar = SnackBar(content: const Text('No user found!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print("wrong password");
        final snackBar = SnackBar(content: const Text('Wrong Password!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    return user;
  }

  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        width: MediaQuery.of(context)
            .size
            .width, // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(
          //aham haga msh btbyn elbox elasfr f eswd ely taht
          scrollDirection:
              Axis.vertical, //bt5alyk t3rf t scroll down fel page bt3tak
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100), //3shan tdy space abyd fo2
              // Image.asset('assets/images/logooo.png', width: 250, height: 250),
              TextField(
                controller: EmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: PasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              MaterialButton(
                  color: Color.fromARGB(255, 82, 79, 77),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  child: const Text(
                    'login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          50)), //el button elborder mdawar
                  onPressed: () async {
                    /* FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: EmailController.text,
                            password: PasswordController.text)*/
                    User? user = await loginUsingEmailPassword(
                            email: EmailController.text,
                            password: PasswordController.text,
                            context: context);
                         print(user);
                        
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    
                  }),

              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ForgetPassword();
                  }));
                },
                child: const Text(
                  'Forget the password ?',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}