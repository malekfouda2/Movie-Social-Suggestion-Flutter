import 'package:flutter/material.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       padding: const EdgeInsets.symmetric(horizontal: 20,),
        width: MediaQuery.of(context).size.width,    // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(       //bt5alyk t3rf t scroll down fel page bt3tak
child: Column(
  children:  <Widget> [
   const SizedBox(height: 150), //3shan tdy space abyd fo2
    TextField(
      decoration: InputDecoration(
        hintText: '' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
      ),
    ),
      SizedBox(height: 20),
       TextField(
      decoration: InputDecoration(
        hintText: 'password' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.red ,
        width: 1.5 ,
        ),
        ),
      ),
    ),
   // MaterialButton(onPressed: onPressed)
  ],
),
        ) , 
      ),
    );
  }
 
}