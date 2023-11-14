
import 'package:flutter/material.dart';
class Textfiled2 extends StatelessWidget {
  
  
  const Textfiled2({
    super.key,
    required this.passwordTextEditingController,
  });

  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordTextEditingController,
      cursorColor: Colors.white,
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
        labelText: "Password",
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}