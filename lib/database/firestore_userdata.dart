/*

This is for Stores the user database what they're published in their/WALL application
These datas stored in a collection called 'Posts' in Firebase.
Each post contains:
- message
- user email
-and Timestamp 
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  //current logged-in user
  User? user = FirebaseAuth.instance.currentUser;
  //get collection of post from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  //post a message
  Future<void> addPost(String message) {
    return posts.add(
      {
        'userEmail': user!.email,
        'PostMessage': message,
        'TimeStamp': Timestamp.now(),
      },
    );
  }

  //read post from database
  Stream<QuerySnapshot> getPostsStream() {
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy(
          'TimeStamp',
          descending: true,
        )
        .snapshots();
    return postStream;
  }
}
