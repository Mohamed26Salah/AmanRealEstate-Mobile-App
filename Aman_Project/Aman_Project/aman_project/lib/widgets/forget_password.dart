import 'package:aman_project/widgets/navBar.dart';
import 'package:aman_project/widgets/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/CustomTextField.dart';
import 'Register_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

final _formKey = GlobalKey<FormState>();

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgetPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _emailController = TextEditingController();
  Future forgetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(""),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/App_Icon-removebg-preview.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Enter Email',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                        color: const Color.fromARGB(255, 205, 153, 51)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Receive an email to reset your password',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 205, 153, 51)),
                  ),
                  const SizedBox(height: 50),

                  //email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 0),
                    child: CustomTextField(
                      controller: _emailController,
                      obscureText: false,
                      labelText: "Enter your Email",
                      hintText: "Email",
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            forgetPassword();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password Reset Email Sent'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.red.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Recover Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Register in button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}