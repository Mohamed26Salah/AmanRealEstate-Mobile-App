import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared_features/custom_decoration.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              elevation: 0 // Background color
                              ),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/App_Icon-removebg-preview.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Hello'.tr,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 52, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome To Aman'.tr,
                    style: TextStyle(
                        fontSize: 18, color: Theme.of(context).primaryColor),
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
                          hintText: ("Email".tr),
                          context: context),
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return 'Enter valid email'.tr;
                        }
                        if (value[value.length - 1] == '.') {
                          return 'Enter valid email'.tr;
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
                          hintText: ("Password".tr),
                          context: context),
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Confirm password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: TextFormField(
                      controller: _passwordConfirmController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Confirm your Password".tr),
                          hintText: ("Password".tr),
                          context: context),
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
                        }
                        if (value != _passwordController.value.text) {
                          return 'Passwords do not match'.tr;
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
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // signUp();
                            UserHelper().signUp(
                                context, _emailController, _passwordController);
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
                            'Sign Up'.tr,
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
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
