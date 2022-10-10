import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/screens/signin_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:share_plus/share_plus.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("daniel"),
            accountEmail: Text("daniel@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/avatar1.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () => null,
          //Share.share("https");
          //},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Policy"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
    );
  }
}
