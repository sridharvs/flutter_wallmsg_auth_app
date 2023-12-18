// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/components/my_button.dart';
import 'package:flutter_wallmsg_auth_app/components/my_textfiels.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});
  //text controller
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //register method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                height: 5,
              ),

              //app name
              const Text(
                'N O T E   W A L L',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //usernmae textfield
              MyTextField(
                hintText: "User Name",
                obscureText: false,
                controller: userNameController,
              ),
              const SizedBox(
                height: 10,
              ),

              //email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),

              //password textfield
              MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController),
              const SizedBox(
                height: 20,
              ),
              //confirm textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: false,
                controller: confirmPasswordController,
              ),
              const SizedBox(
                height: 10,
              ),

              //forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //Register button
              MyButton(
                text: "Register Here",
                onTap: register,
              ),
              const SizedBox(
                height: 25,
              ),

              //don't have an account? Register here!
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      " then LogIn Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
