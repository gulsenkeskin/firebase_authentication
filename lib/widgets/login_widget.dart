import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding:const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration:const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration:const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 7)
              ),

                onPressed: signIn,
                icon:const Icon(
                  Icons.lock_open,
                  size: 28,
                ),
                label:const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      );

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
  }
}
