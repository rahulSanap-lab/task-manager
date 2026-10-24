import 'package:flutter/material.dart';
import 'package:taskmanager/view/login_screen.dart';
import 'package:taskmanager/view/onboarding_screen.dart';
import 'package:taskmanager/view/signup_screen.dart';
import 'package:taskmanager/view/splash_screen.dart';
import 'package:taskmanager/view/task_screen.dart';

void main ( ){
  runApp(myApp()) ;
}

class myApp extends StatefulWidget {
  const new({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:task(),
        

      

      routes: {
        "onboarding":(context) => OnboardingScreen(),
        "signup":(context)=> SignupScreen(),
        "login" :(context) => login()
      },
    );
  
  }
}