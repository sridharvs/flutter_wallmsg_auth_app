import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  //shows current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          //data received
          else if (snapshot.hasData) {
            //extract data
            Map<String, dynamic>? user = snapshot.data!.data();
            return Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //for back button
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 20),
                    child: Row(
                      children: [
                        BackButton(),
                      ],
                    ),
                  ),
                  //profile picture
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    user!['username'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user!['email'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("No Data");
          }
        },
      ),
    );
  }
}
