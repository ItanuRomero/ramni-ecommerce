import 'package:flutter/material.dart';

class TheFormField extends StatelessWidget {
  const TheFormField({Key? key, required this.hintText, required this.password})
      : super(key: key);

  final String hintText;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Favor inserir todos os dados';
          }
          return null;
        },
        obscureText: password,
      ),
    );
  }
}
