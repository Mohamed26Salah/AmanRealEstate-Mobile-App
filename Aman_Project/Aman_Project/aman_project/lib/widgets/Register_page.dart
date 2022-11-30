import 'package:aman_project/models/user_management.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_message.dart';
import '../data/globals.dart' as val;

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  //Verification

  Future signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // StreamBuilder<User>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: ((context, snapshot) {
      //     if (snapshot.hasData && snapshot.data != null) {
      //       UserHelper.saveUser(snapshot.data);
      //     }
      //   }),
      // );

      Navigator.of(context).pushReplacementNamed('/verify');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errormessage("Error!", "The password provided is too weak.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      } else if (e.code == 'email-already-in-use') {
        errormessage("Error!", "The account already exists for that email.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            elevation: 0 // Background color
                            ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/App_Icon-removebg-preview.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Hello',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 52, color: Color.fromARGB(255, 205, 153, 51)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome To Aman',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 205, 153, 51)),
                  ),
                  SizedBox(height: 50),
                  //First name
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0, left: 15, right: 15, bottom: 10),
                  //   child: CustomTextField(
                  //     controller: _firstNameController,
                  //     obscureText: false,
                  //     labelText: "Enter your First Name",
                  //     hintText: "First Name",
                  //     validator: (value) {
                  //       if (!value!.isValidName) {
                  //         return 'Please enter a valid name';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  // //Last name
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0, left: 15, right: 15, bottom: 10),
                  //   child: CustomTextField(
                  //     controller: _lastNameController,
                  //     obscureText: false,
                  //     labelText: "Enter your Last Name",
                  //     hintText: "Last Name",
                  //     validator: (value) {
                  //       if (!value!.isValidName) {
                  //         return 'Please enter a valid name';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
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

                  //password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: CustomTextField(
                      controller: _passwordController,
                      obscureText: true,
                      labelText: "Enter your Password",
                      hintText: "Password",
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // Confirm password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
                      controller: _passwordConfirmController,
                      obscureText: true,
                      labelText: "Confirm your Password",
                      hintText: "Password",
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
                        }
                        return null;
                      },
                    ),
                  ),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            signUp();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
