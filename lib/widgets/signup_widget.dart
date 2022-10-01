import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpWidget({Key? key, required  this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
