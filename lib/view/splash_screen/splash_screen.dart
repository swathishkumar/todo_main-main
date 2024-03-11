import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/color_constants/color_constants.dart';
import 'package:todo_app/utils/image_constants/image_constants.dart';
import 'package:todo_app/view/home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.mainblack,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 100,
              width: 100,
              child: Image.asset(Imageconstants.splashlogo)),
          Text(
            "To Do",
            style: TextStyle(
                color: Colorconstants.mainwhite,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          )
        ],
      )),
    );
  }
}
