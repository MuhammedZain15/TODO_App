import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/application_theme_manager.dart';
import 'package:todo_app/core/easyloading.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/feature/login/login_view.dart';
import 'package:todo_app/feature/regisration/signup.dart';
import 'package:todo_app/feature/splash/splash_view.dart';
import 'package:todo_app/feature/task/edit_view.dart';
import 'package:todo_app/layout/layout_view.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child:  MyApp(),

    ),

  );
  confing();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguageCode),
      title: "TODO App",
      debugShowCheckedModeBanner: false,
      theme: Application_Theme_manager.LightThemeData,
      darkTheme: Application_Theme_manager.DarkThemeData,
      themeMode: provider.currentThemeMode,
      initialRoute: "/",
      routes: {
        splashview.routename: (context) =>  splashview(),
        LayoutView.routename: (context) =>  LayoutView(),
        Signup.routename: (context) =>  Signup(),
        LoginView.routename: (context) =>  LoginView(),
        TaskEditPage.routename: (context) =>  TaskEditPage(),
      },

      builder: EasyLoading.init(),
    );
  }
}
