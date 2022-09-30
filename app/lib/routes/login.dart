import 'package:app/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          elevation: 0,
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
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.pink,
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    child: Image.asset(
                      "images/logo_app.png",
                      color: Colors.white,
                      width: 80,
                    ),
                  ),
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
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.only(
                                right: 60, left: 60, bottom: 20, top: 20),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteGenerator.uploadPhoto);
                          },
                          child: const Text('SIGN IN'),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ])));
  }
}
