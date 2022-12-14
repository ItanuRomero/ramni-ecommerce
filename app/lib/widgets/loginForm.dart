import 'package:app/models/user.dart';
import 'package:app/routes.dart';
import 'package:app/widgets/formField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheFormField(
            label: "E-mail",
            hint: "Digite seu e-mail aqui",
            password: false,
            controller: controllerEmail,
          ),
          TheFormField(
            label: "Senha",
            hint: "Digite sua senha aqui",
            password: true,
            controller: controllerPassword,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Consumer<User>(builder: (context, storedValue, child) {
                return TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.all(20.0),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: const StadiumBorder()),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (storedValue.validadeLogin(
                          controllerEmail.text, controllerPassword.text)) {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.uploadPhoto);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('E-mail ou senha incorretos')),
                        );
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text('SIGN IN',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                );
              }),
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Esqueceu sua senha?',
              style: TextStyle(color: Colors.black38),
            ),
          ))
        ],
      ),
    );
  }
}
