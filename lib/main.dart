import 'package:flutter/material.dart';
import 'package:taskmanager/view/about_screen.dart';
import 'package:taskmanager/view/dashBoard_screen.dart';
import 'package:taskmanager/view/login_screen.dart';
import 'package:taskmanager/view/onboarding_screen.dart';
import 'package:taskmanager/view/privacy_screen.dart';
import 'package:taskmanager/view/profile_screen.dart';
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
      home:splash(),
        

      

      routes: {
        "onboarding":(context) => OnboardingScreen(),
        "signup":(context)=> SignupScreen(),
        "login" :(context) => login(),
        "task":(context) => task(),
        'dashboard':(context) => DashboardScreen(),
        'profile':(context) => ProfileScreen(),
        "about":(context) => AboutAppScreen(),
        "privacy":(context) => PrivacyPolicyScreen()
      },
    );
  
  }
}