import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const new({super.key});

  @override
  State<login> createState() => _loginState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
 var formkey = GlobalKey<FormState>() ;

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFF5F0FF),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Icon(
            Icons.task_alt,
            size: 70,
            color: Colors.blue,
          ),
               
          
              SizedBox(height: 30),
          
              Email() ,
          
              SizedBox(height: 20),
          
              Pass() ,
          
             SizedBox(height: 25),
          
              btn(),
          
             SizedBox(height: 15),
              txtbtn()
          
            ],
          ),
        ),
      ),
    );
  }

  Widget text (){
    return Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ) ;
  }

  Widget Email(){
    return TextFormField(
      validator: (value) {
        if(value == null || value.isEmpty){
          return "please enter email" ;
        }

        else if (!value.contains("@")){
          return "Enter valid email addres" ;
        }
      },
      controller: email,
              decoration:  InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(Icons.email),
              ),
            );
  }

  Widget Pass (){
    return TextFormField(
      validator: (value) {
        if(value == null || value.isEmpty){
          return "please enter password";
        }
      },
      controller: password,
              obscureText: true,
              decoration:  InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                
                prefixIcon: Icon(Icons.lock),
              ),
            );
  }

  Widget btn (){
    return SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                 if(formkey.currentState!.validate()){
                  email.clear();
                  password.clear();

                 }
                  print("Login clicked");
                },
                child: Text("Login"),
              ),
            );
  }

Widget txtbtn (){
  return 
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "signup");
              },
              child:  Text(
                "Don't have an account? Sign Up",
              ),
            );
}
}