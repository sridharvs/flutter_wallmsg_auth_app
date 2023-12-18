import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/pages/login_page.dart';
import 'package:flutter_wallmsg_auth_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrregisterState();
}

class _LoginOrregisterState extends State<LoginOrRegister> {
  //initially, show the login page
  bool showLoginPage = true;

  //toggle between Login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
