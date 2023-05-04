import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Addlead3 extends StatefulWidget {
  @override
  State<Addlead3> createState() => _Addlead3State();
}

class _Addlead3State extends State<Addlead3> {
  final leadnamecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final secondarymobilecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  var defaultservicetype = 'Service Type';
  var defaultsourcetype = "Source";
  var defaultleadstatus = ' ';
  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                      '3. Loan Details',
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
                              "Deal Amount",
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
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: defaultservicetype,
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultservicetype = newValue!;
                            });
                          },
                          items: <String>[
                            'Service Type',
                            'Car Loan',
                            'Education Loan',
                            'Property Loan',
                            'Business Loan',
                            'Personal Loan',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          value: defaultsourcetype,
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultsourcetype = newValue!;
                            });
                          },
                          items: <String>[
                            'Source',
                            'Personal',
                            'Reference',
                            'Google',
                            'Linkedin',
                            'Instagram',
                            'Facebook',
                            'Dialer',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: <Widget>[
                          Column(children: <Widget>[
                            const Align(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Follow Up Date",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat'),
                                )),
                            Container(
                              height: 40,
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: ' ',
                                    hintText: ' ',
                                    prefixIcon: InkWell(
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2021-03-16
                                            setState(() {
                                              dateInput.text =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          } else {}
                                        },
                                        child: Icon(Icons.calendar_today))),
                              ),
                            ),
                          ]),
                          SizedBox(width: 25),
                          Column(children: <Widget>[
                            const Align(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Follow Up Time",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat'),
                                )),
                            Container(
                              height: 40,
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: ' ',
                                    hintText: ' ',
                                    prefixIcon: InkWell(
                                        onTap: () async {
                                          TimeOfDay? pickedTime =
                                              await showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context:
                                                context, //context of current state
                                          );

                                          if (pickedTime != null) {
                                            print(pickedTime.format(
                                                context)); //output 10:51 PM
                                            DateTime parsedTime =
                                                DateFormat.jm().parse(pickedTime
                                                    .format(context)
                                                    .toString());
                                            //converting to DateTime so that we can further format on different pattern.
                                            print(
                                                parsedTime); //output 1970-01-01 22:53:00.000
                                            String formattedTime =
                                                DateFormat('HH:mm:ss')
                                                    .format(parsedTime);
                                            print(
                                                formattedTime); //output 14:59:00
                                            //DateFormat() is from intl package, you can format the time on any pattern you need.
                                          } else {}
                                        },
                                        child:
                                            Icon(Icons.access_time_outlined))),
                              ),
                            ),
                          ]),
                        ]),
                        Column(children: <Widget>[
                          const Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Lead Status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat'),
                              )),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            dropdownColor: Colors.white,
                            value: defaultleadstatus,
                            onChanged: (String? newValue) {
                              setState(() {
                                defaultleadstatus = newValue!;
                              });
                            },
                            items: <String>[
                              ' ',
                              'Cancelled',
                              'Pre-login',
                              'Follow Up',
                              'Documents Pending',
                              'All Docs Received',
                              'Logged-In',
                              'Banker Verification',
                              'Approval',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Remarks",
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
                          height: 10,
                        ),
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
                                      'Add',
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
                      ])),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                ])));
  }
}
