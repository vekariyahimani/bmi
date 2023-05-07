import 'dart:async';

import 'package:flutter/material.dart';

import 'bmi_screen.dart';



class SplshScreen extends StatefulWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 4),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BmiScreen(),));

    },);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 300,
                width: 100,
                child: Image.asset("assets/image/b.png",fit: BoxFit.cover,)),
          ),
          Container(
            height: 771,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(Color(0xff192841)),Color(0xff102e40)]
              ),
            ),child: Padding(
            padding: EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Text("BMI  CALCULATOR",style: TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 2),),
                Padding(padding:  EdgeInsets.only(top: 370),child: Text("Check your BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,letterSpacing: 1,wordSpacing: 1),),)
              ],

            ),
          ),
          ),
        ],
      ),
    ));
  }
}
