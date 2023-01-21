import 'dart:async';
import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/user.dart';
import 'package:aman_project/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../data/user_management.dart';
import '../shared_features/custom_loading_screen.dart';

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

  Future<void> redirectToHome() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(
            child: LoadingScreen(),
          );
        });
    await UserHelper.saveUser();
    await UserHelper().getNewUserData().then((value) {
      UserModel user = UserModel.fromSnapshot(value);
      ref.read(newUserDataProivder.notifier).state = user;
      // Navigator.of(context).pushReplacementNamed('/home');
      NumberManagement.getNumbers().then((value) {
        ref.read(numberProv.notifier).state = value;
      });

      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

// content: Text('$e'),
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Another email has been send!'.tr),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        leading: const BackButton(),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/happy.png",
                        width: 100,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Welcome To Aman'.tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        redirectToHome();
                      },
                      child: Text('Continue'.tr),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/icons8-email-open-100.png",
                        width: 100,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please Verify Your Email'.tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Kindly check Spam'.tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        sendVerificationEmail();
                      },
                      child: Text('Resend Verification Email'.tr),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
