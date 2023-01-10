import 'package:flutter/material.dart';
import '../navpages/home.dart';
import '../src/LoginSceen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        backgroundColor: Color(0xFF242A32),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        width: MediaQuery.of(context)
            .size
            .width, // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(
          scrollDirection:
              Axis.vertical, //bt5alyk t3rf t scroll down fel page bt3tak
          child: Form(
            key: formKey,
            //aham haga msh btbyn elbox elasfr f eswd ely taht

            child: Column(
              children: <Widget>[
                const SizedBox(height: 100), //3shan tdy space abyd fo2
                Image.asset('assets/images/logooo.png',
                    width: 250, height: 250),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                            .hasMatch(value!)) {
                      //w stands for any number or text
                      return "Error. Enter a valid email";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.email ,color :Colors.white ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        value.length < 7 ||
                        RegExp(r'\s').hasMatch(value!)) {
                      return "Error, password should be 7char+ and not include spaces";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.password ,color :Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!) ||
                            RegExp(r'\s').hasMatch(value!))) {
                      //r for string and quotes for condition,^means beginning of a string
                      return "Name should not include a number or spaces only";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                     hintStyle: TextStyle(color: Colors.white),

                    prefixIcon: Icon(Icons.email_rounded ,color :Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[male]+$').hasMatch(value!) ||
                        !RegExp(r'^[female]+$').hasMatch(value!)) {
                      return "Error, genderd should be either male or female";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "your age should be a number";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: ('Date of Birth'),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.date_range ,color :Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                      return "Error, name a country";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Country',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20), //borders for the email text
                      borderSide: const BorderSide(
                        color: Colors.orange,
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
                      'Sign Up',
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
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
