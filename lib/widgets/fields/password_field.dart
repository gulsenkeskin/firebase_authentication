import 'package:firebase_authentication/common/string_extensions.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  //şifreyi gizlemek için
  bool obscurePassword=true;

  @override
  Widget build(BuildContext context) => TextFormField(
    validator: (value){
      if(value!.isWhitespace()){
        return "Bu alan boş geçilemez";
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
          color: Colors.green,
        ),
      )

    ),
  );
}
