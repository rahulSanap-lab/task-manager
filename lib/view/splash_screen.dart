import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

class splash extends StatefulWidget {
  const new({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

void initState(){
  super.initState() ;

  Future.delayed(Duration(seconds: 3),
  
  (){
    Navigator.pushNamed( context,"onboarding") ;
  } );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF0F6FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 255, 205, 205),
                borderRadius: BorderRadius.circular(30),
              ),
              child:  Icon(
                Icons.task_alt_rounded,
                size: 75,
                color: Color.fromARGB(255, 14, 50, 158),
              ),
            ),

             SizedBox(height: 25),

             Text(
              Appstring.tskflow,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24345C),
              ),
            ),

             SizedBox(height: 10),

            Text(
              Appstring.plit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

             SizedBox(height: 40),

            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Color.fromARGB(255, 124, 198, 233),
              ),
            ),
          ],
        ),
      ),
    );
  }
}