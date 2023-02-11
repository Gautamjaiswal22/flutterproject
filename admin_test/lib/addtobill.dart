import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addbid extends StatefulWidget {
  const addbid({super.key});

  @override
  State<addbid> createState() => _addbidState();
}

class _addbidState extends State<addbid> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController IDController = TextEditingController();
  // TextEditingController RATEController = TextEditingController();
  // TextEditingController MRPController = TextEditingController();
  // TextEditingController MIDController = TextEditingController();
  // TextEditingController itemcountController = TextEditingController();
  // TextEditingController totalController = TextEditingController();
  // String val = '';
  String nameController = "";
  String IDController = "";
  int RATEController = 0;
  int MRPController = 0;
  int MIDController = 0;
  int itemcountController = 0;
  int totalController = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: IDController,
                      onChanged: (text) {
                        IDController = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ID ',
                        hintText: 'Enter ID',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: nameController,
                      onChanged: (text) {
                        nameController = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine name',
                        hintText: 'ENTER MEDICINE NAME',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: RATEController,
                      onChanged: (text) {
                        RATEController = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'RATE ',
                        hintText: 'Enter Rate',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: MRPController,
                      onChanged: (text) {
                        MRPController = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'MRP ',
                        hintText: 'Enter MRP',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: MIDController,
                      onChanged: (text) {
                        MIDController = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'MID ',
                        hintText: 'Enter MID',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: itemcountController,
                      onChanged: (text) {
                        itemcountController = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'quantity ',
                        hintText: 'Enter quantity',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      // controller: totalController,
                      onChanged: (text) {
                        totalController = int.parse(text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'total price ',
                        hintText: 'Enter total price',
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
                      // }r
                      // var b = MIDController;

                      var a = {
                        "mrp": MRPController,
                        "rate": RATEController,
                        "id": IDController,
                        "mid": MIDController,
                        "name": nameController,
                        "itemcount": itemcountController,
                        "total": totalController
                      };
                      FirebaseFirestore.instance
                          .collection('USERS')
                          .doc("GAUTAM")
                          .collection("BILL")
                          .add(a);
                    },
                  )
                ],
              )),
        ));
  }
}
