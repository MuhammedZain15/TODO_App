import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController FullnameController = TextEditingController();

    bool isobscure = false;
    var theme = Theme.of(context);
    var formkey = GlobalKey<FormState>();
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
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            title: const Text("Create Account"),
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
                    controller: FullnameController,
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
                        "Full-Name",
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
                    obscureText: true,
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
                          "Create Account",
                          style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
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
