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
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color.fromARGB(255, 234, 133, 143),
                                    Color.fromARGB(255, 255, 62, 104),
                                    Color.fromARGB(255, 255, 36, 83),
                                    Color.fromARGB(255, 220, 14, 73),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.only(
                                  right: 60, left: 60, bottom: 20, top: 20),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RouteGenerator.loginPage);
                            },
                            child: const Text('NEXT'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ])
            ])));
  }
}
