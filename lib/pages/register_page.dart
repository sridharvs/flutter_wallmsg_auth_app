import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/components/my_button.dart';
import 'package:flutter_wallmsg_auth_app/components/my_textfiels.dart';
import 'package:flutter_wallmsg_auth_app/hepler/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //register method
  Future<void> register() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    // make sure password match
    if (passwordController.text != confirmPasswordController.text) {
      //pop loading circle
      Navigator.pop(context);
      //display error msg to user
      displayMessageToUser("Password does't match", context);
    } else {
      //if password do match
      try {
        //try creating the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // create a user document and add to firebase
        createUserDocuments(userCredential);
        //pop loading circle
        if (mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);
        //display error message to users
        // ignore: use_build_context_synchronously
        displayMessageToUser(e.code, context);
      }
    }
  }

  //create a user document and collect them in firebase
  Future<void> createUserDocuments(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userNameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                height: 30,
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
                height: 10,
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
                    onTap: widget.onTap,
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
