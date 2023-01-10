import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mangemovies extends StatefulWidget {
  const mangemovies({super.key});

  @override
  State<mangemovies> createState() => _mangemoviesState();
}

class _mangemoviesState extends State<mangemovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Container(
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
      child: const Text('Add movie',
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
      color: Colors.orange,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: const Text('Edit movie',
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
      child: const Text('DELETE MOVIE',
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
