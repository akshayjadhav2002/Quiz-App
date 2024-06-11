import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:quizzapp/Controllers/get_data_from_api.dart";
import "package:quizzapp/View/home_screen.dart";


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State createState()=>_SplashScreenState();
  }

  class _SplashScreenState extends State{

    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () { 
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context){
        return const HomeScreen();
      })
      );
    });
  }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: Stack( 
          children: [ 
            Column(
              children: [
               Image.asset(
                "assets/Images/background.png",
              
                ),
                Image.asset(
                "assets/Images/background1.png",
                
                ),
                Expanded(
                  child: Image.asset(
                  "assets/Images/background3.png",
                  
                  ),
                ),
              ]
            ),
              Positioned(
                top: 350,
                left: 80,
                child: Image.asset(
                "assets/Images/Logo.png",
                
                ),
              ),
              
                
                
              
              
            
          ],
        ),
      );
    }
  }