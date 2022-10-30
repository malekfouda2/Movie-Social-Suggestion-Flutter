import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:index/navpages/home.dart';
import 'package:index/src/ForgetPassword.dart';
import 'package:index/src/SignUp.dart';
import 'package:index/data/dummydata.dart';
import 'package:index/models/loginModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
              Image.asset('assets/images/logooo.png', width: 250, height: 250),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), //borders for the email text
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                  color: Colors.orange,
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
                  onPressed: () {
                    var mail = email.text;
                    var pass = password.text;
                    mail.toString();
                    pass.toString();
                    LoginModel db = new LoginModel();
                    if (db.compare(mail, pass)) {
                      print("success");
                    } else {
                      print("failure");
                    }
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
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 0, 116), fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  }));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 0, 116), fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
