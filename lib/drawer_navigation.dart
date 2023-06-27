import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m3_avenue/leads.dart';
import 'package:m3_avenue/profilescreen.dart';

import 'main.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
          accountName: Text('Snehith'),
          accountEmail: Text('snehithbashetty9gmail.com'),
          decoration: BoxDecoration(color: Colors.black),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('DashBoard'),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => leadsscreen())),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => profilescreen())),
        ),
        ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                        child: CircularProgressIndicator(),
                      ));
              try {
                FirebaseAuth.instance.signOut();
              } on FirebaseAuthException catch (e) {
                print(e);
              }
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
            }),
      ])),
    );
  }
}
