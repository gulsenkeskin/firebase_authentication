import 'package:firebase_authentication/common/string_extensions.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  const PasswordField({Key? key, required this.controller,  this.textInputAction}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  //şifreyi gizlemek için
  bool obscurePassword=true;

  @override
  Widget build(BuildContext context) => TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: widget.controller,
    textInputAction: widget.textInputAction ?? TextInputAction.next,
    validator: (value){
      if(value!.isWhitespace() && value.length < 6){
        return "Şifre en az 6 karakter olmalıdır";
      }
    },
    obscureText: obscurePassword,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      labelText: "Password",
      helperText: "",
      hintText: "Password",
      suffixIcon: IconButton(
        onPressed: ()=> setState(() => obscurePassword=!obscurePassword),
        icon: Icon(
          obscurePassword ? Icons.visibility :Icons.visibility_off,
          color: Colors.teal,
        ),
      )

    ),
  );
}
