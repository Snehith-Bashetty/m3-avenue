import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead2.dart';
import 'package:email_validator/email_validator.dart';

import 'lead.dart';

// var lead = new Map();
Lead lead = Lead(
    name: '',
    mobile: '',
    secondary: '',
    email: '',
    address: '',
    leadpin: '',
    company: '',
    experience: '',
    salary: '',
    companyaddress: '',
    companypin: '',
    city: '',
    dealamount: '',
    servicetype: '',
    sourcetype: '',
    followdate: '',
    followtime: '',
    leadstatus: '',
    remarks: '');

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
  bool validate = false;

  // @override
  // void dispose() {
  //   leadnamecontroller.dispose();
  //   mobilecontroller.dispose();
  //   secondarymobilecontroller.dispose();
  //   emailcontroller.dispose();
  //   addresscontroller.dispose();
  //   pincodecontroller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaquery = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                            cursorHeight: 30,
                            decoration: new InputDecoration(
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
                                onTap: () {
                                  setState(() {
                                    if (leadnamecontroller.text.isEmpty) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Lead Name cannot be empty "),
                                            );
                                          });
                                    } else if (mobilecontroller.text.isEmpty ||
                                        mobilecontroller.text.length != 10) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Please Enter valid mobile number"),
                                            );
                                          });
                                    } else if (secondarymobilecontroller
                                            .text.isEmpty ||
                                        secondarymobilecontroller.text.length !=
                                            10) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Please Enter valid Secondary mobile number"),
                                            );
                                          });
                                    } else if (emailcontroller.text.isEmpty) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Please Enter valid Email"),
                                            );
                                          });
                                    } else if (addresscontroller.text.isEmpty) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Address cannot be empty "),
                                            );
                                          });
                                    } else if (pincodecontroller.text.isEmpty) {
                                      validate = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Message"),
                                              content: Text(
                                                  "Pincode cannot be empty "),
                                            );
                                          });
                                    } else {
                                      validate = true;
                                    }
                                  });
                                  if (validate) {
                                    lead.name = leadnamecontroller.text;
                                    lead.mobile = mobilecontroller.text;
                                    lead.secondary =
                                        secondarymobilecontroller.text;
                                    lead.email = emailcontroller.text;
                                    lead.address = addresscontroller.text;
                                    lead.leadpin = pincodecontroller.text;

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Addlead2(lead)));
                                  } else {
                                    validate = false;
                                  }
                                }),
                          ),
                        ])
                      ])),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                ])));
  }
}
