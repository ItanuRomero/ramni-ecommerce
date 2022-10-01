import 'package:app/routes.dart';
import 'package:app/widgets/signUpForm.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: SizedBox(
            child: Image.asset(
              "images/logo_app.png",
              color: Colors.white,
              width: 80,
            ),
          ),
          leading: const BackButton(color: Colors.white),
        ),
        body: const MyStatelessWidget());
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.pink,
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.topCenter,
            child: ListView(shrinkWrap: true, children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: SignUpForm(),
                    )
                  ],
                )
              ])
            ])));
  }
}
