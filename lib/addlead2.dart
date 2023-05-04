import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead3.dart';

class Addlead2 extends StatefulWidget {
  @override
  State<Addlead2> createState() => _Addlead2State();
}

class _Addlead2State extends State<Addlead2> {
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
                      '2. Income Details',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 20.0, right: 20.0),
                      child: Column(children: <Widget>[
                        const Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Company/Business Name",
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
                        SizedBox(height: 10.0),
                        Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Experience / Vintage",
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
                              "Salary / Turnover",
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
                              "Company / Business Address",
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
                        Row(children: <Widget>[
                          Column(children: <Widget>[
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
                              width: 150,
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
                          ]),
                          SizedBox(width: 25),
                          Column(children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "City",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat'),
                                )),
                            new Container(
                              width: 150,
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
                          ]),
                        ]),
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
                                      'Previous',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  )),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
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
                        ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              child: Container(
                                  width: 300,
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
                                      builder: (context) => Addlead3())),
                            )),
                      ])),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                ])));
  }
}
