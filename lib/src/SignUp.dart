import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State <SignUp> createState() =>  SignUpState();
}

class  SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Sign up'),
        backgroundColor: Colors.orange[700],
      ),
 body: Container(
       padding: const EdgeInsets.symmetric(horizontal: 20,),
        width: MediaQuery.of(context).size.width,    // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(       //aham haga msh btbyn elbox elasfr f eswd ely taht
 scrollDirection: Axis.vertical, //bt5alyk t3rf t scroll down fel page bt3tak 
child: Column(                        
  children:  <Widget> [
   const SizedBox(height: 100), //3shan tdy space abyd fo2
   Image.asset('assets/images/logooo.png' , width: 250 , height: 250),
    TextField(
      decoration: InputDecoration(
        hintText: 'Enter your Email' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
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
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
      ),
    ),
    SizedBox(height: 20),
   
  
    TextField(
      decoration: InputDecoration(
        hintText: 'Name' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
      ),
    ),

SizedBox(height: 20),
    TextField(
      decoration: InputDecoration(
        hintText: 'Gender' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
      ),
    ),

SizedBox(height: 20),
    TextField(
      decoration: InputDecoration(
        hintText: 'Age' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
      ),
    ),

SizedBox(height: 20),
TextField(
      decoration: InputDecoration(
        hintText: 'Country' ,
        prefixIcon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), //borders for the email text
        borderSide: const BorderSide(
          color: Colors.orange ,
        width: 1.5 ,
        ),
        ),
      ),
    ),
SizedBox(height: 20),

    MaterialButton(
      color: Colors.orange,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: const Text('Sign Up',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25 ,
        fontWeight: FontWeight.bold,
      ),
      ),
       shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),  //el button elborder mdawar 
    onPressed: (){}
    ),
    const SizedBox(height: 20,),
   ],
),
        ) , 
      ),

    );
  }
}