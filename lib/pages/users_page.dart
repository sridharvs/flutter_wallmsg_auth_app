import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/components/my_list_tile.dart';
import 'package:flutter_wallmsg_auth_app/hepler/helper_function.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          //any errors
          if (snapshot.hasError) {
            displayMessageToUser("Somthing error happened", context);
          }
          //show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return Text("No data");
          }
          //get all users
          final users = snapshot.data!.docs;

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 10),
                child: Row(
                  children: [
                    BackButton(),
                  ],
                ),
              ),

              //list of users in the app
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    //get individual user
                    final user = users[index];
                    //get data from each user
                    String username = user['username'];
                    String email = user['email'];
                    return MyListTile(title: username, subTitle: email);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
