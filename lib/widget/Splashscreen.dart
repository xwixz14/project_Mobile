import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/forms/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){

    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xffA89DBF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/Logo.png"))),
              ),
              Container(
                child: Text(
                  "Pustakaku",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
