import 'package:app/routes.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatelessWidget());
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/logo_app.png',
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.white,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.pink,
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 20, top: 20),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.signUpPage);
                      },
                      child: const Text('GET STARTED'),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.loginPage);
                },
                child: const Text('SIGN IN'),
              ),
            ],
          )
        ]));
  }
}
