import 'package:flutter/material.dart';
class add_movies extends StatefulWidget {
  const add_movies({super.key});

  @override
  State <add_movies> createState() =>  add_moviesState();
}

class  add_moviesState extends State<add_movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Add Movie'),
        backgroundColor: Colors.orange[700],
      ),
 body: Container(
       padding: const EdgeInsets.symmetric(horizontal: 20,),
        width: MediaQuery.of(context).size.width,    // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(       //aham haga msh btbyn elbox elasfr f eswd ely taht
 scrollDirection: Axis.vertical, //bt5alyk t3rf t scroll down fel page bt3tak 
child: Column(                        
  children:  <Widget> [
   //const SizedBox(height: 1), //3shan tdy space abyd fo2
   Text('Add your last movie and tell us your opnion!', 
 style: TextStyle(fontWeight: FontWeight.bold ,height: 5, fontSize: 20, color: Colors.orange ),

   ),
    TextFormField(
      decoration: InputDecoration(
        hintText: 'Movie Name' ,
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
        hintText: 'Movie Language' ,
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
        hintText: 'Year of the film' ,
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
        hintText: 'Your rate from 1 to 5' ,
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
        hintText: 'your comment' ,
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

SizedBox(height: 20),

    MaterialButton(
      color: Colors.orange,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: const Text('Add',
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