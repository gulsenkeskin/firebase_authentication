import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const FlutterLogo(
                size: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hey There, \n Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min 6 characters'
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: signUp,
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 32,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.white),
                      text: 'Already have an account?  ',
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Log In',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary))
                  ]))
            ],
          ),
        ),
      );

  Future signUp() async {
    final isValid=formKey.currentState!.validate();
    if(!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
