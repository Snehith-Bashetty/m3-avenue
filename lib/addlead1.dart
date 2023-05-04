import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead2.dart';

class Addlead1 extends StatefulWidget {
  @override
  State<Addlead1> createState() => _Addlead1State();
}

class _Addlead1State extends State<Addlead1> {
  final leadnamecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final secondarymobilecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Leads"),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                    child: Text(
                      '1. Personal Details',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                      child: Column(children: <Widget>[
                        const Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Lead Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: leadnamecontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Mobile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: mobilecontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Secondary Mobile",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: secondarymobilecontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: emailcontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: addresscontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Pincode",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            )),
                        new Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: new Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: new TextField(
                            controller: pincodecontroller,
                            decoration: new InputDecoration(
                              hintText: ' ',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(children: <Widget>[
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                                child: Container(
                                    width: 120,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    )),
                                onTap: () => {}),
                          ),
                          SizedBox(width: 40),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              child: Container(
                                  width: 120,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  )),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Addlead2())),
                            ),
                          ),
                        ])
                      ])),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                ])));
  }
}
