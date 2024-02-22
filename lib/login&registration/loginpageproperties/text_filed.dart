import 'package:flutter/material.dart';

class Textfiled1 extends StatelessWidget {
  const Textfiled1({
    super.key,
    required this.emailTextEditingController,
  });

  final TextEditingController emailTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailTextEditingController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        labelText: "Email",
        labelStyle: TextStyle(
          fontSize: 14.0,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}