import 'package:app/routes.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Nome"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Favor inserir todos os dados';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando dados')),
                  );
                  Future.delayed(const Duration(milliseconds: 3000), () {
                    setState(() {
                      Navigator.of(context).pushNamed(RouteGenerator.loginPage);
                    });
                  });
                }
              },
              child: const Text('NEXT'),
            ),
          ),
        ],
      ),
    );
  }
}
