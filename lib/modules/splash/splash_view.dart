import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});


  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, PageRoutesName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/splash_background.png");
  }
}
