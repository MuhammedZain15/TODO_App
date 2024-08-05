import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/modules/login/login_view.dart';
import 'package:todo_app/modules/regisration/signup.dart';
import 'package:todo_app/modules/splash/splash_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const splashview(),
          settings: settings,
        );
      case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case PageRoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => const Signup(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const splashview(),
          settings: settings,
        );
    }
  }
}
