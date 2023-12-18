import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  //logout method
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //home tile
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text("H O M E"),
                  onTap: () {
                    //this is already in the home so just pop/tap the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              // profile tile
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text("P R O F I L E"),
                  onTap: () {
                    // pop/tap the drawer
                    Navigator.pop(context);
                    //navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),
              // user tile

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text("U S E R S"),
                  onTap: () {
                    //pop/tap the drawer
                    Navigator.pop(context);
                    //navigate to profile page
                    Navigator.pushNamed(context, '/user_page');
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: Text("LogOut"),
              onTap: () {
                //pop/tap the drawer
                Navigator.pop(context);
                // for logout
                logOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
