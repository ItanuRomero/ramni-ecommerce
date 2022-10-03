import 'package:app/models/user.dart';
import 'package:app/routes.dart';
import 'package:app/routes/home.dart';
import 'package:app/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User("user", null)),
      ],
      child: MaterialApp(
        title: 'Prova',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'SFProDisplayRegular',
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.pink,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
        onGenerateTitle: (context) => "Prova",
        initialRoute: RouteGenerator.startPage,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
