import 'package:flutter/material.dart';
import 'package:perpustakaan/forms/login.dart';
import 'package:perpustakaan/pages/home.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/model/user.dart';
import 'package:perpustakaan/event/event_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: //SplashScreen(),

   FutureBuilder(
        future: EventPref.getUser(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          return snapshot.data == null
              ? LoginScreen()
              : snapshot.data!.role == 'Admin'
                  ? HomeScreen()
                  : HomeScreen();
        },
      ),
    );
  }
}
