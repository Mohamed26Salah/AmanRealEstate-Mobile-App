import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/user_management.dart';
import '../shared_features/custom_decoration.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // savePref(bool boool) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setBool("remember", boool);
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 205, 153, 51)),
                  ),
                  const SizedBox(height: 50),

                  //email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your Email".tr),
                          hintText: ("Email".tr)),
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return ('Enter valid email'.tr);
                        }
                        if (value[value.length - 1] == '.') {
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
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your Password".tr),
                          hintText: ("Password".tr)),
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
                            // savePref(remember);
                            UserHelper().saveUserPref(remember);
                            UserHelper().signIn(ref, context, _emailController,
                                _passwordController);
                            // signIn();
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
                            style: const TextStyle(
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
                            style: const TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: remember,
                        onChanged: (_) {
                          setState(() {
                            remember = !remember;
                          });
                        },
                        fillColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              remember = !remember;
                            });
                          },
                          child: const Text("Remember Me?"))
                    ],
                  ),

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

  // final googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;

  // GoogleSignInAccount get user => _user!;

  // Future<void> signInWithGoogle() async {
  //   //-------------------------------------1st method--------------------------------------------------
  //   GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount!.authentication;

  //   AuthCredential authCredential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken);

  //   //_auth.signInWithCredential(authCredential);

  //   UserCredential authResult =
  //       await _auth.signInWithCredential(authCredential);

  //   User? user = authResult.user;
  //   print('hi');
  //   print('user email = ${user!.email}');
  //----------------------------------------------------------------------------------------------------------------------------------------------------

  // final googleUser = await googleSignIn.signIn();

  // if(googleUser == null) return;

  // _user = googleUser;

  // final googleAuth = await googleUser.authentication;

  // final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  // await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
