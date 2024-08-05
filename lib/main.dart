import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/core/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TODO App",
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
    );
  }
}