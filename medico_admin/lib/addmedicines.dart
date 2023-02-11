import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addmed extends StatefulWidget {
  const addmed({super.key});

  @override
  State<addmed> createState() => _addmedState();
}

class _addmedState extends State<addmed> {
  String val = '';
  String IDController = "";
  String RATEController = "";
  String MRPController = "";
  String MIDController = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADD PRODUCTS'),
        ),
        body: Padding(
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
                      val = text;
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
                      RATEController = text;
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
                      MRPController = text;
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
                      MIDController = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'MID ',
                      hintText: 'Enter MID',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('SUBMIT'),
                  onPressed: () {
                    List lstname = [];
                    for (int i = 1; i <= val.length; i++) {
                      lstname.add(val.substring(0, i));
                    }
                    var a = {
                      "MRP": MRPController,
                      "RATE": RATEController,
                      "id": IDController,
                      "name": val,
                      "name_array": lstname
                    };
                    FirebaseFirestore.instance.collection('medicines').add(a);
                  },
                )
              ],
            )));
  }
}
