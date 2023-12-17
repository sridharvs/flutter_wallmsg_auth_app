// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/components/my_textfiels.dart';

class LoginPage extends StatelessWidget {
  //text controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.person,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),

            //app name
            const Text(
              'N O T E   W A L L',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //email textfield
            MyTextField(
              hintText: "",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 25,
            ),

            //password textfield

            //forget password

            //signin button

            //don't have an account? Register here!
          ],
        ),
      ),
    );
  }
}
