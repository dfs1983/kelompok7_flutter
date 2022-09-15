import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("nama_akun"),
              accountEmail: Text("example@gmail.com"),
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
          //ListTile(
            //leading: Icon(Icons.share),
            //title: Text("Share"),
            //onTap: () async {
              //Share.share("https");
            //},
          //),
          Divider(),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Policies"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
