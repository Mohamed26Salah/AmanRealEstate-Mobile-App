import 'dart:async';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/user_management.dart';

class EmailVerification extends ConsumerStatefulWidget {
  const EmailVerification({super.key});

  @override
  ConsumerState<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends ConsumerState<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  void redirectToHome() {
    UserHelper.saveUser();
    UserHelper().getNewUserData().then((value) {
      UserModel user = UserModel.fromSnapshot(value);
      ref.read(newUserDataProivder.notifier).state = user;
      // Navigator.of(context).pushReplacementNamed('/home');
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: const Text(""),
      ),
      // bottomNavigationBar: const NavBarGR(),
      body: Center(
        child: SafeArea(
          child: (isEmailVerified)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/happy.png", width: 100),
                    const SizedBox(height: 15),
                    const Text(
                      'Welcome To Aman',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 205, 153, 51),
                      ),
                      onPressed: () {
                        redirectToHome();
                      },
                      child: const Text('Continue'),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Image.asset("assets/images/icons8-email-open-100.png",
                        width: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Please Verify Your Email \n Kindly check Spam',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 205, 153, 51),
                      ),
                      onPressed: () {
                        sendVerificationEmail();
                      },
                      child: const Text('Resend Verification Email'),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
