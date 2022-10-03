import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelloUserWidget extends StatelessWidget {
  const HelloUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello ${context.read<User>().name}',
      style: const TextStyle(color: Colors.white, fontSize: 40),
    );
  }
}
