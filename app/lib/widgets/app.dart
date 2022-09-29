import 'package:app/routes.dart';
import 'package:app/routes/home.dart';
import 'package:app/routes/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateTitle: (context) => "Prova",
      initialRoute: RouteGenerator.startPage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
