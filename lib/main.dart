import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead1.dart';

//import 'homescreen.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "M3 Avenue",
      debugShowCheckedModeBanner: false,
      home: Addlead1(),
    );
  }
}
