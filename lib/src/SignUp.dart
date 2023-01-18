import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;
import '../src/LoginSceen.dart';
import '../models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final EmailController = TextEditingController();
final PasswordController = TextEditingController();
final NameController = TextEditingController();
final genderController = TextEditingController();
final dobController = TextEditingController();

class SignUp extends StatefulWidget {
  SignUp({super.key});
  @override
  _SignUpState createState() => _SignUpState();
}

final formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class _SignUpState extends State<SignUp> {
  late DatabaseReference dbRef;

  var imageUrl;
  var downloadUrl;
  var imagee;
  var greyimage =
      'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("users");
  }

  setImage(String imagee) {
    imagee = imagee;
  }

  getImage() {
    return imagee;
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile? image;

    //await Permission.photos.request();
    //var permissionStatus = await Permission.photos.status;

    image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image!.path);
    if (image != null) {
      var snapshot =
          await _storage.ref().child(p.basename(image.path)).putFile(file);
      downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        greyimage = imageUrl;
        setImage(imageUrl);
      });
    } else {
      print('No path Recieved');
    }
  }

  Future createUser(String email, String password, String name, String gender,
      String dob, String userImage, String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set(
      {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'dob': dob,
        'image': userImage,
        'id': id
      },
    );
    print('new user created');
  }

  @override
  Widget build(BuildContext context) {
    bool obsecureText = true;
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
                // Image.asset('assets/images/logooo.png',
                //     width: 250, height: 250),
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
                ),
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
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: NameController,
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
                    prefixIcon: Icon(Icons.email_rounded, color: Colors.white),
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
                  controller: genderController,
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
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: dobController,
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
                  // onChanged: ((value) => model.country = value)
                ),
                SizedBox(height: 20),

                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(greyimage))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: Colors.orange),
                            child: TextButton(
                              child: const Icon(
                                Icons.upload,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                uploadImage();
                              },
                            )),
                      )
                    ],
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
                      if (formKey.currentState!.validate()) {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: EmailController.text,
                            password: PasswordController.text);

                        createUser(
                                NameController.text,
                                EmailController.text,
                                PasswordController.text,
                                genderController.text,
                                dobController.text,
                                greyimage,
                                userId)
                            .then((value) {
                          print("Created new account");

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
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
