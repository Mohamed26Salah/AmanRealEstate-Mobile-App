import 'package:aman_project/data/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/usersJoex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme_manager.dart';
import 'change_lang.dart';

ThemeManager _themeManager = ThemeManager();

class EditProfile extends StatefulWidget {
  final ThemeManager? themeManager;
  const EditProfile({super.key, this.themeManager});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  var newPassword = " ";
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;

  changePassword() async {
    try {
      await user.updatePassword(newPassword);

      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black26,
          content: Text('Password Changed successfully.. Login again please'),
        ),
      );
      // ignore: empty_catches
    } catch (error) {}
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacementNamed('/');
  }

  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/owner.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              ),
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('${user.email}'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CustomTextField(
                        controller: newPasswordController,
                        obscureText: true,
                        labelText: ("New Password".tr),
                        hintText: ("Type your new password".tr),
                        validator: (value) {
                          if (!value!.isValidPassword) {
                            return 'enter At Least 8 characters one letter and one number'
                                .tr;
                          }

                          if (value.isEmpty) {
                            return 'Password cannot be empty'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CustomTextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        labelText: ("Confirm Password".tr),
                        hintText: ("Type your new password".tr),
                        validator: (value) {
                          if (value != newPasswordController.value.text) {
                            return 'Passwords do not match!'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // buildTextField(
              //     "Confirm Password".tr, 'Type your new password'.tr, true),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Cancel".tr,
                      style: const TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          setState(() {
                            newPassword = newPasswordController.text;
                          });
                          changePassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "SAVE".tr,
                        style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    buildLanguageDialog(context);
                  },
                  child: Text('change Language'.tr)),
              Row(
                children: [
                  Text("Dark Mode:".tr),
                  Switch(
                      value: widget.themeManager!.themeMode == ThemeMode.dark,
                      onChanged: (newValue) {
                        widget.themeManager!.toggleTheme(newValue);
                      }),
                  ElevatedButton(
                      onPressed: signOut,
                      child: Text(
                        'Sign out',
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String? placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
