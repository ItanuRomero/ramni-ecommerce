import 'package:app/routes.dart';
import 'package:app/widgets/formField.dart';
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
          const TheFormField(
              label: "Nome", hint: "Digite seu nome aqui", password: false),
          const TheFormField(
            label: "E-mail",
            hint: "Digite seu e-mail aqui",
            password: false,
          ),
          const TheFormField(
            label: "Telefone",
            hint: "Digite seu telefone aqui",
            password: false,
          ),
          const TheFormField(
            label: "Senha",
            hint: "Digite sua senha aqui",
            password: true,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 10)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Criando seu usuário')),
                    );
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.loginPage);
                      });
                    });
                  }
                },
                child: const Text('NEXT'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
