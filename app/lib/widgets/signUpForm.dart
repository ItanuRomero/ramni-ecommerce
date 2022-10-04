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
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: const StadiumBorder()),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text('SIGN IN',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
