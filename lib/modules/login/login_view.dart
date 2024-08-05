import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
            title: const Text("Login"),
          ),
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Text(
                    "Welcome Back!",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyLarge,
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
                      hintText: "Enter your Email address",
                      label: Text(
                        "E-mail",
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
                        return "Please Enter Password";
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
                          isobscure ? Icons.visibility_off : Icons.visibility,
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
                      hintText: "Enter your Password",
                      label: Text(
                        "Password",
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text(
                      "Forget password ? ",
                      style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
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
                      if (formkey.currentState!.validate()) {
                        /* Navigator.of(context).pushReplacementNamed(PageRoutesName.login);*/
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Login",
                          style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PageRoutesName.signup);
                    },
                    child: Text(
                      "Or create my account ",
                      style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
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
