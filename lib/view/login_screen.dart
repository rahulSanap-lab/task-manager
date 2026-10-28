
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

var formkey = GlobalKey<FormState>();

class _loginState extends State<login> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F4FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Logo
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAE5FF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.task_alt,
                        size: 70,
                        color: Color(0xFF3478F6),
                      ),
                    ),

                    SizedBox(height: 25),

                    // Heading
                    Text(
                      Appstring.loginWelcome,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF20245B),
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      Appstring.loginSubtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                      ),
                    ),

                    SizedBox(height: 40),

                    Email(),

                    SizedBox(height: 20),

                    Pass(),

                    SizedBox(height: 5),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                Appstring.loginForgotClicked,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          Appstring.loginForgotPassword,
                          style: TextStyle(
                            color: Color(0xFF6650F5),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    btn(),

                    SizedBox(height: 25),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFD4D0E8),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            Appstring.loginOrContinueWith,
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFD4D0E8),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    // Google Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                Appstring.loginGoogleNotConnected,
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xFFD4D0E8),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              size: 35,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Text(
                              Appstring.loginContinueGoogle,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF20245B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    txtbtn(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Email() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Appstring.loginEmailEmpty;
        } else if (!value.contains("@")) {
          return Appstring.loginEmailInvalid;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.loginEmailHint,
        prefixIcon: Icon(Icons.email_outlined),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFFD4D0E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFF3478F6),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget Pass() {
    return TextFormField(
      controller: password,
      obscureText: !showPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Appstring.loginPasswordEmpty;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.loginPasswordHint,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            showPassword
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFFD4D0E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xFF3478F6),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget btn() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3478F6),
            Color(0xFF8657F5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(Appstring.loginSuccessMsg),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );

            email.clear();
            password.clear();

            Navigator.pushNamed(context, "dashboard");
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          Appstring.loginBtn,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget txtbtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Appstring.loginNoAccount,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "signup");
          },
          child: Text(
            Appstring.loginSignUp,
            style: TextStyle(
              color: Color(0xFF6650F5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
