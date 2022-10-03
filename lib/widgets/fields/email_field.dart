import 'package:firebase_authentication/common/string_extensions.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    validator: (value){
      if(!value!.isValidEmail()){
        return 'Lütfen geçerli bir email adresi girin.';
      }
    },
    decoration: const InputDecoration(
        labelText: "Email",
        helperText: "",
        hintText: "email@gmail.com"
    ),
  );
}