import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:m3_avenue/leads.dart';

import 'loginscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "M3 Avenue",
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: MainPage(),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something Went Wrong'));
              } else if (snapshot.hasData) {
                return leadsscreen();
              } else {
                return loginscreen();
              }
            }));
  }
}
