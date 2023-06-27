import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:m3_avenue/leads.dart';
import 'lead.dart';

class Addlead3 extends StatefulWidget {
  final Lead lead;
  const Addlead3(this.lead);

  @override
  State<Addlead3> createState() => _Addlead3State();
}

class _Addlead3State extends State<Addlead3> {
  final dealamountcontroller = TextEditingController();
  final remarkscontroller = TextEditingController();
  var defaultservicetype = 'Service Type';
  var defaultsourcetype = "Source";
  var defaultleadstatus = ' ';
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  bool validate = false;
  void initState() {
    dateInput.text = " ";
    timeInput.text = " "; //set the initial value of text field
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
                            controller: dealamountcontroller,
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
                              width: 160,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: dateInput,
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
                                          }
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
                              width: 160,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: timeInput,
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
                                                DateFormat('HH:mm')
                                                    .format(parsedTime);
                                            print(
                                                formattedTime); //output 14:59:00
                                            //DateFormat() is from intl package, you can format the time on any pattern you need.
                                            setState(() {
                                              timeInput.text =
                                                  formattedTime; //set output date to TextField value.
                                            });
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
                            controller: remarkscontroller,
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
                              onTap: () {
                                setState(() {
                                  if (dealamountcontroller.text.isEmpty) {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Deal Amount cannot be empty "),
                                          );
                                        });
                                  } else if (defaultservicetype ==
                                      'Service Type') {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Please select Service Type"),
                                          );
                                        });
                                  } else if (defaultsourcetype == "Source") {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Please select Source Type"),
                                          );
                                        });
                                  } else if (defaultleadstatus == ' ') {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Please select Lead Status"),
                                          );
                                        });
                                  } else if (dateInput.text == " ") {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content:
                                                Text("Please Select Date "),
                                          );
                                        });
                                  } else if (timeInput.text == " ") {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text("Please Select Time"),
                                          );
                                        });
                                  } else if (remarkscontroller.text.isEmpty) {
                                    validate = false;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                                "Remarks cannot be empty "),
                                          );
                                        });
                                  } else {
                                    validate = true;
                                  }
                                });
                                if (validate) {
                                  var lead = widget.lead;
                                  lead.dealamount = dealamountcontroller.text;
                                  lead.servicetype = defaultservicetype;
                                  lead.sourcetype = defaultsourcetype;
                                  lead.followdate = dateInput.text;
                                  lead.followtime = timeInput.text;
                                  lead.leadstatus = defaultleadstatus;
                                  lead.remarks = remarkscontroller.text;
                                  FirebaseFirestore.instance
                                      .collection("student_details")
                                      .add({
                                    'Lead Name': lead.name,
                                    'Mobile': lead.mobile,
                                    'Secondary Mobile': lead.secondary,
                                    'Email': lead.email,
                                    'Address': lead.address,
                                    'Pincode': lead.leadpin,
                                    'Company Name': lead.company,
                                    'Experience': lead.experience,
                                    'Salary': lead.salary,
                                    'Comapany Address': lead.companyaddress,
                                    'Company Pincode': lead.companypin,
                                    'Company City': lead.city,
                                    'Deal Amount': lead.dealamount,
                                    'Service Type': lead.servicetype,
                                    'Source Type': lead.sourcetype,
                                    'Follow Up Date': lead.followdate,
                                    'Follow Up Time': lead.followtime,
                                    'Lead Status': lead.leadstatus,
                                    'Remarks': lead.remarks
                                  });
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => leadsscreen()));
                                }
                              }),
                        ),
                      ])),
                ])));
  }
}
