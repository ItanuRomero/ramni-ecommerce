import 'package:app/routes/home.dart';
import 'package:app/routes/login.dart';
import 'package:app/routes/signUp.dart';
import 'package:app/routes/start.dart';
import 'package:app/routes/uploadPhoto.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String startPage = '/';
  static const String loginPage = '/login';
  static const String signUpPage = '/signUp';
  static const String uploadPhoto = '/uploadPhoto';
  static const String home = '/home';

  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startPage:
        return MaterialPageRoute(
          builder: (_) => const Start(
            title: 'Start',
          ),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const Login(
            title: 'Login',
          ),
        );
      case signUpPage:
        return MaterialPageRoute(
          builder: (_) => const SignUp(
            title: 'Sign Up',
          ),
        );
      case uploadPhoto:
        return MaterialPageRoute(
          builder: (_) => const UploadPhoto(
            title: 'Upload Photo',
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const Home(
          ),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
