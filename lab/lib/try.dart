import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lab.dart';

class addpatient extends StatefulWidget {
  const addpatient({super.key});

  @override
  State<addpatient> createState() => _addpatientState();
}

class _addpatientState extends State<addpatient> {
  String NameController = '';
  String IDController = "";
  String AgeController = "";
  String MobileController = "";
  String AddressController = "";
  String? gender; //no radio button will be selected on initial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TextField Example'),
      ),
      body: SingleChildScrollView(
        child: new Container(
          // color: Color.fromARGB(255, 98, 100, 102),
          height: 700,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 247, 249, 247),
                height: 700.0,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                // controller: nameController,
                                onChanged: (text) {
                                  NameController = text;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  hintText: 'ENTER NAME',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                // controller: RATEController,
                                onChanged: (text) {
                                  AgeController = text;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'AGE ',
                                  hintText: 'Enter AGE',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(1),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: Text("Male"),
                                      value: "male",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: Text("Female"),
                                      value: "female",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: Text("Other"),
                                      value: "other",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                // controller: MRPController,
                                onChanged: (text) {
                                  MobileController = text;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'MOBILE NO',
                                  hintText: 'Enter MOBILE NO',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                // controller: MIDController,
                                onChanged: (text) {
                                  AddressController = text;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',
                                  hintText: 'Enter Address',
                                ),
                              ),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('SUBMIT'),
                              onPressed: () {
                                // List lstname = [];
                                // for (int i = 1; i <= val.length; i++) {
                                //   lstname.add(val.substring(0, i));
                                // }
                                var a = {
                                  "Mobile": MobileController,
                                  "age": AgeController,
                                  // "id": IDController,
                                  "name": NameController,
                                  "address": AddressController,
                                  "gender": gender,
                                };
                                FirebaseFirestore.instance
                                    .collection('user')
                                    .doc("jaiswal")
                                    .collection("patient1")
                                    .doc("detail")
                                    .set(a);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TestPage()));
                              },
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
