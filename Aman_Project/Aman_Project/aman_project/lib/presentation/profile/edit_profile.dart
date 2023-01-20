import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';
import '../../theme/theme_manager.dart';
import '../shared_features/change_lang.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared_features/custom_decoration.dart';

ThemeManager _themeManager = ThemeManager();

class EditProfile extends ConsumerStatefulWidget {
  final ThemeManager? themeManager;
  const EditProfile({super.key, this.themeManager});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  var theme;
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  var newPassword = " ";
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(newUserDataProivder);
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: NoGlowScroll(
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
                            ),
                            child: Center(
                              // child: Text(userData?.email ?? "Loading"),
                              child: Text(
                                (userData?.email ?? "Loading")[0].capitalize!,
                                style: const TextStyle(fontSize: 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(userData?.email ?? "Loading"),
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
                        child: TextFormField(
                          controller: newPasswordController,
                          obscureText: true,
                          decoration: CommonStyle.textFieldStyle(
                              labelText: ("New Password".tr),
                              hintText: ("Type your new password".tr),
                              context: context),
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
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: CommonStyle.textFieldStyle(
                              labelText: ("Confirm your Password".tr),
                              hintText: ("Type your new password".tr),
                              context: context),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          newPasswordController.text = "";
                          confirmPasswordController.text = "";
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Cancel".tr,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          setState(() {
                            newPassword = newPasswordController.text;
                          });
                          UserHelper().changePassword(context, newPassword);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Save".tr,
                        style: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: ListTile(
                        trailing: Switch(
                            value: widget.themeManager!.themeMode ==
                                ThemeMode.dark,
                            onChanged: (newValue) {
                              UserHelper().savePref(newValue);
                              // savePref(newValue);
                              widget.themeManager!.toggleTheme();
                            }),
                        title: Text("Dark Mode".tr),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        title: Text("Change Language".tr),
                        onTap: () {
                          buildLanguageDialog(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: (() {
                        UserHelper().signOut(context);
                      }),
                      child: Center(
                        child: Text(
                          'Sign out'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
