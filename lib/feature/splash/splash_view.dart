import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/feature/login/login_view.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});
  static const String routename = "/";

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginView.routename);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Image.asset(provider.isDark()
        ? "assets/images/splash_dark.png"
        : "assets/images/splash_background.png");
  }
}
