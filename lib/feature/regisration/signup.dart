import 'package:flutter/material.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/feature/login/login_view.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const String routename = "Signup";
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isobscure = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.png"),
            fit: BoxFit.cover,
          ),
          color: Color(0xFFDFECDB)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(lang.createaccount),
          ),
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                    controller: fullnameController,
                    cursorColor: theme.primaryColor,
                    cursorHeight: 30,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person,
                        color: theme.primaryColor,
                      ),
                      errorStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: theme.primaryColor)),
                      hintText: "Enter your Name",
                      label: Text(
                        lang.fullname,
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter your mail";
                      }
                      return null;
                    },
                    controller: emailController,
                    cursorColor: theme.primaryColor,
                    cursorHeight: 30,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: theme.primaryColor,
                      ),
                      errorStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: theme.primaryColor)),
                      hintText: lang.enteryouremail,
                      label: Text(
                        lang.email,
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: isobscure,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter your mail";
                      }
                      return null;
                    },
                    controller: passwordController,
                    cursorColor: theme.primaryColor,
                    cursorHeight: 30,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isobscure = !isobscure;
                          });
                        },
                        icon: Icon(
                          isobscure ? Icons.visibility : Icons.visibility_off,
                          color: theme.primaryColor,
                        ),
                      ),
                      errorStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 2, color: theme.primaryColor)),
                      hintText: lang.enteryourPassword,
                      label: Text(
                        lang.password,
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        FirebaseUtils.createUserWithEmailAndPassword(emailController.text, passwordController.text).then((value)  {
                          Navigator.pushReplacementNamed(context, LoginView.routename);
                          if(value){
                            Navigator.pushReplacementNamed(context, LoginView.routename);
                          }
                        },);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang.createaccount,
                          style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
