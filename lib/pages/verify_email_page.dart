import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils/style.dart';
import 'package:firebase_authentication/utils/utils.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      //eposta doğrulanmamışsa bir doğrulama epostası gönderir
      sendVerificationEmail();

      //3 saniyede bir epostanın doğrulanıp doğrulanmadığını kontrol eder
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    //kullanıcıyı yeniden yükler
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'E-postanıza bir doğrulama e-postası gönderildi',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton.icon(
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: const Text('Resent Email',
                      style: TextStyle(fontSize: 24)),
                  style: buttonStyle(),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  style: buttonStyle(),

                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        );
}
