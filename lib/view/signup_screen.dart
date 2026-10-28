
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController signupName = TextEditingController();
TextEditingController signupEmail = TextEditingController();
TextEditingController signupPassword = TextEditingController();
TextEditingController signupConfirmPassword = TextEditingController();

var signupFormKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F0FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),

                    // Logo
                    Icon(
                      Icons.person_add_alt_1,
                      size: 80,
                      color: Color(0xFF536DFE),
                    ),

                    SizedBox(height: 25),

                    // Heading
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

                    NameField(),

                    SizedBox(height: 15),

                    EmailField(),

                    SizedBox(height: 15),

                    PassField(),

                    SizedBox(height: 15),

                    ConfirmPassField(),

                    SizedBox(height: 30),

                    signupBtn(),

                    SizedBox(height: 20),

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

  Widget NameField() {
    return TextFormField(
      controller: signupName,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your full name";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.signupFullNameHint,
        prefixIcon: Icon(Icons.person_outline),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFFD4D0E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF536DFE), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget EmailField() {
    return TextFormField(
      controller: signupEmail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your email";
        } else if (!value.contains("@") || !value.contains(".")) {
          return "Enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.signupEmailHint,
        prefixIcon: Icon(Icons.email_outlined),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFFD4D0E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF536DFE), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget PassField() {
    return TextFormField(
      controller: signupPassword,
      obscureText: !showPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a password";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.signupPasswordHint,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            showPassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFFD4D0E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF536DFE), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget ConfirmPassField() {
    return TextFormField(
      controller: signupConfirmPassword,
      obscureText: !showConfirmPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        } else if (value != signupPassword.text) {
          return "Passwords do not match";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Appstring.signupConfirmPasswordHint,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showConfirmPassword = !showConfirmPassword;
            });
          },
          icon: Icon(
            showConfirmPassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFFD4D0E8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF536DFE), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget signupBtn() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF536DFE),
            Color(0xFF8657F5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (signupFormKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sign Up Successful!"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            signupName.clear();
            signupEmail.clear();
            signupPassword.clear();
            signupConfirmPassword.clear();
            Navigator.pushNamed(context, 'dashboard');
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
          Appstring.signupBtn,
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
          Appstring.signupHaveAccount,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            Appstring.signupLoginLink,
            style: TextStyle(
              color: Color(0xFF536DFE),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
