import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mangeuser extends StatefulWidget {
  const mangeuser({super.key});

  @override
  State<mangeuser> createState() => _mangeuserState();
}

class _mangeuserState extends State<mangeuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backk.png"),
          fit: BoxFit.cover
        ),
       ),
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        width: MediaQuery.of(context).size.width,    // ba3ml el width bta3 el screen bt3ty
        child: SingleChildScrollView(       //aham haga msh btbyn elbox elasfr f eswd ely taht
 scrollDirection: Axis.vertical,
 child: Column(        
                  
  children:  <Widget> [
    
SizedBox(height: 100,),


 MaterialButton(
      color: Colors.orange,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: const Text('Add account',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25 ,
        fontWeight: FontWeight.bold,
      ),
      ),
       shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),  //el button elborder mdawar 
    onPressed: (){}
    ),
SizedBox(height: 30,),
 MaterialButton(
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: const Text('DELETE ACCOUNT',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25 ,
        fontWeight: FontWeight.bold,
      ),
      ),
       shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),  //el button elborder mdawar 
    onPressed: (){}
    ),


  ],
      ),
      ),
      ),
    );
  }
}
