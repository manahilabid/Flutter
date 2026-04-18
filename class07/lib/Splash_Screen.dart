import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initStates() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
          () =>
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MyHomePage(title: "minahil",))),

    );
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('splash Screen',
            style: TextStyle(color: Colors.blue, fontSize: 35,),
          ),
        ),
      );
}