import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m3_avenue/addlead1.dart';
import 'package:m3_avenue/drawer_navigation.dart';

import 'lead.dart';

class leadsscreen extends StatefulWidget {
  @override
  State<leadsscreen> createState() => _leadsscreenState();
}

class _leadsscreenState extends State<leadsscreen> {
  var defaultsorttype = 'Sort By';
  var defaultflitertype = "Filter By";
  ScrollController scrollcontroller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerNavigation(),
        appBar: AppBar(
          title: Text("M3 Avenue"),
          backgroundColor: Colors.black,
        ),
        body: Scrollbar(
            thumbVisibility: true, //always show scrollbar
            thickness: 10, //width of scrollbar
            radius: Radius.circular(20), //corner radius of scrollbar
            scrollbarOrientation:
                ScrollbarOrientation.right, //which side to show scrollbar
            child: SingleChildScrollView(
                child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 204, 203, 203),
                shape: BoxShape.rectangle,
              ),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: const Text(
                          "Leads",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat'),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(2)),
                          height: 25,
                          width: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Addlead1()))),
                    SizedBox(
                      width: 80,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: const Text(
                          "Team Leads",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat'),
                        )),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 204, 203, 203),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                        alignment: Alignment.center,
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          // Step 3.
                          value: defaultsorttype,
                          // Step 4.
                          items: <String>[
                            'Sort By',
                            'Name',
                            'Follow Up Date',
                            'Deal Amount'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultsorttype = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                        alignment: Alignment.center,
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          // Step 3.
                          value: defaultflitertype,
                          // Step 4.
                          items: <String>[
                            'Filter By',
                            'Lead Status',
                            'City',
                            'Service type',
                            'Source Type'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultflitertype = newValue!;
                            });
                          },
                        ),
                      ),
                    )
                  ]),
                ),
                StreamBuilder<List<Lead>>(
                  stream: readLeads(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      final leads = snapshot.data!;
                      return ListView.builder(
                          controller: scrollcontroller,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: leads.length,
                          itemBuilder: (BuildContext context, int index) {
                            return leadcard(
                                leads[index].name,
                                leads[index].dealamount,
                                leads[index].salary,
                                leads[index].leadpin,
                                leads[index].leadstatus);
                          });
                    } else {
                      return (const Text(' '));
                    }
                  },
                ),
              ]),
            ))));
  }

  // Reading Data from Firebase
  Stream<List<Lead>> readLeads() => FirebaseFirestore.instance
      .collection("student_details")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Lead.fromJson(doc.data())).toList());
// End of data reading

  Widget leadcard(String name, String dealamount, String income, String pincode,
      String leadstatus) {
    return Column(children: <Widget>[
      SizedBox(
        height: 15,
      ),
      Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            Container(
              height: 150,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                // alignment: Alignment.bottomLeft,
                child: new RotationTransition(
                  turns: new AlwaysStoppedAnimation(270 / 360),
                  child: new Text(
                    "Per",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "M3Am30025567",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: <Widget>[
                  Container(
                      child: Column(children: <Widget>[
                    Text(
                      "Deal Amount",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13.0,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      dealamount,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat'),
                    )
                  ])),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      child: Column(children: <Widget>[
                    Text(
                      "Income",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13.0,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      income,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat'),
                    )
                  ])),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      child: Column(children: <Widget>[
                    Text(
                      "Pincode",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 13.0,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      pincode,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat'),
                    )
                  ])),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.sticky_note_2,
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Row(children: <Widget>[
                    Text(
                      "Lead Status:  ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12.0,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      leadstatus,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat'),
                    )
                  ])),
                ]),
              ]),
            )
          ],
        ),
      )
    ]);
  }
}
