import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../providers/create_user_provider.dart';
import '../src/LoginSceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final EmailController = TextEditingController();
final PasswordController = TextEditingController();
final NameController = TextEditingController();

class SignUp extends ConsumerStatefulWidget {
  SignUp({super.key});
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

final formKey = GlobalKey<FormState>();

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final provider = createUserProvider;
    final model = ref.read(createUserProvider);

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
                    controller: EmailController,
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
                      prefixIcon: Icon(Icons.email, color: Colors.white),
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
                    onChanged: ((value) => model.email = value)),
                SizedBox(height: 20),
                TextFormField(
                    controller: PasswordController,
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
                      prefixIcon: Icon(Icons.password, color: Colors.white),
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
                    onChanged: ((value) => model.password = value)),
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
                      prefixIcon:
                          Icon(Icons.email_rounded, color: Colors.white),
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
                    onChanged: ((value) => model.name = value)),

                SizedBox(height: 20),
                TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[male]+$').hasMatch(value!) ||
                          !RegExp(r'^[female]+$').hasMatch(value!)) {
                        return "Error, gender should be either male or female";
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
                    onChanged: ((value) => model.gender = value)),

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
                      prefixIcon: Icon(Icons.date_range, color: Colors.white),
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
                    onChanged: ((value) => model.dob = value)),

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
                  // onChanged: ((value) => model.country = value)
                ),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    final picked = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (picked != null) {
                      model.file = File(picked.path);
                    }
                  },
                  child: Consumer(
                    builder: (context, ref, child) {
                      ref.watch(provider.select((value) => value.file));

                      return Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: (model.image != null || model.file != null)
                                ? DecorationImage(
                                    image: model.file != null
                                        ? FileImage(model.file!)
                                        : NetworkImage(model.image!)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                : null),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (model.image == null && model.file == null)
                              Expanded(
                                child: Center(
                                  child: Icon(Icons.photo),
                                ),
                              ),
                            Material(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Pick Image".toUpperCase(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

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
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: EmailController.text,
                              password: PasswordController.text)
                          .then((value) {
                        print("Created new account");
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
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
