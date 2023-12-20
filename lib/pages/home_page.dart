import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallmsg_auth_app/components/my_drawer.dart';
import 'package:flutter_wallmsg_auth_app/components/my_list_tile.dart';
import 'package:flutter_wallmsg_auth_app/components/my_post_button.dart';
import 'package:flutter_wallmsg_auth_app/components/my_textfiels.dart';
import 'package:flutter_wallmsg_auth_app/database/firestore_userdata.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //firestore access
  final FirestoreDatabase database = FirestoreDatabase();
//text conrtoller
  final TextEditingController postMessageController = TextEditingController();
  //post message
  void postMessage() {
    //only post if there's somthing in the textfield
    if (postMessageController.text.isNotEmpty) {
      String message = postMessageController.text;
      database.addPost(message);
    }
    //clear the conroller
    postMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "W A L L",
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //Textfield box for user type usage
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: "Type Here",
                    obscureText: false,
                    controller: postMessageController,
                  ),
                ),
                //post button
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),
          //posts read from firebase-cloud/ mesages will appear in our app
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              //show loading circle indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              //get all posts
              final posts = snapshot.data!.docs;
              //no data?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("No post.. please write somthing!"),
                  ),
                );
              }
              //return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    //get each individual post
                    final post = posts[index];
                    //get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['userEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    //return as a list tile
                    return MyListTile(title: message, subTitle: userEmail);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
