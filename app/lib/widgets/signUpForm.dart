import 'package:app/models/user.dart';
import 'package:app/routes.dart';
import 'package:app/widgets/formField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPhoneNumber.dispose();
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
            label: "Nome",
            hint: "Digite seu nome aqui",
            password: false,
            controller: controllerName,
          ),
          TheFormField(
            label: "E-mail",
            hint: "Digite seu e-mail aqui",
            password: false,
            controller: controllerEmail,
          ),
          TheFormField(
            label: "Telefone",
            hint: "Digite seu telefone aqui",
            password: false,
            controller: controllerPhoneNumber,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Criando seu usuário')),
                      );
                      storedValue.setSignUpData(
                          controllerName.text,
                          controllerEmail.text,
                          controllerPhoneNumber.text,
                          controllerPassword.text);
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
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
