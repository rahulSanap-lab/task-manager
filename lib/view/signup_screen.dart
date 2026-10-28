
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF5F0FF),
      body: Padding(
        padding:  EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(height: 40),
      
               Icon(
                Icons.person_add_alt_1,
                size: 80,
                color: Color(0xFF536DFE),
              ),
      
              SizedBox(height: 25),
      
             Text(
                Appstring.signupCreateAccount,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191936),
                ),
              ),
      
             SizedBox(height: 10),
      
               Text(
                Appstring.signupSubtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
      
               SizedBox(height: 35),
      
              TextField(
                decoration: InputDecoration(
                  hintText: Appstring.signupFullNameHint,
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
      
               SizedBox(height: 15),
      
              TextField(
                decoration: InputDecoration(
                  hintText: Appstring.signupEmailHint,
                  prefixIcon:  Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
      
              SizedBox(height: 15),
      
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: Appstring.signupPasswordHint,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon:  Icon(Icons.visibility_off),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
      
               SizedBox(height: 15),
      
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: Appstring.signupConfirmPasswordHint,
                  prefixIcon:  Icon(Icons.lock_outline),
                  suffixIcon:  Icon(Icons.visibility_off),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
      
               SizedBox(height: 30),
      
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF536DFE),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child:  Text(
                    Appstring.signupBtn,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
      
               SizedBox(height: 20),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    Appstring.signupHaveAccount,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:  Text(
                      Appstring.signupLoginLink,
                      style: TextStyle(
                        color: Color(0xFF536DFE),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
