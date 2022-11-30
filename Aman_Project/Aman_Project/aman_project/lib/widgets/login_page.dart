import 'package:aman_project/widgets/custom_message.dart';
import 'package:aman_project/widgets/navBar.dart';
import 'package:aman_project/widgets/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/CustomTextField.dart';
import '../models/user_management.dart';
import 'Register_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../data/globals.dart' as val;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'custom_message.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        final user = FirebaseAuth.instance.currentUser!;
        UserHelper.saveUser(user);

        Navigator.of(context).pushNamed('/home');
      } else {
        Navigator.of(context).pushNamed('/verify');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errormessage("Error!", "No user found for that email.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      } else if (e.code == 'wrong-password') {
        errormessage("Error!", "Wrong password provided for that user.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    ('Hello'.tr),
                    style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                        color: const Color.fromARGB(255, 205, 153, 51)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ('Welcome To Aman'.tr),
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
                      labelText: ("Enter your Email".tr),
                      hintText: ("Email".tr),
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return ('Enter valid email'.tr);
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
                      labelText: ("Enter your Password".tr),
                      hintText: ("Password".tr),
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
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
                            signIn();

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
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
                        child: Center(
                          child: Text(
                            ('Sign In'.tr),
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

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
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
                        child: Center(
                          child: Text(
                            ('Register'.tr),
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
                  // SignInButton(
                  //   Buttons.Google,
                  //   text: "Sign in with Google",
                  //   onPressed: () async {
                  //    await signInWithGoogle();
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => navBar(),
                  //     //   ),
                  //     // );
                  //   },
                  // ),

                  const SizedBox(height: 15),
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/forget');
                    },
                  ),
                  // const Text(
                  //   'Do Not Have An Account ? ',
                  //   style: TextStyle(
                  //     fontSize: 10,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> signInWithGoogle() async {
    //-------------------------------------1st method--------------------------------------------------
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    //_auth.signInWithCredential(authCredential);

    UserCredential authResult =
        await _auth.signInWithCredential(authCredential);

    User? user = authResult.user;
    print('hi');
    print('user email = ${user!.email}');
    //----------------------------------------------------------------------------------------------------------------------------------------------------

    // final googleUser = await googleSignIn.signIn();

    // if(googleUser == null) return;

    // _user = googleUser;

    // final googleAuth = await googleUser.authentication;

    // final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    // await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
