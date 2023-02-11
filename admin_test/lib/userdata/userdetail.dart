import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class adduser extends StatefulWidget {
  const adduser({super.key});

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController IDController = TextEditingController();
  // TextEditingController RATEController = TextEditingController();
  // TextEditingController MRPController = TextEditingController();
  // TextEditingController MIDController = TextEditingController();
  String val = '';
  // String nameController = "";
  String IDController = "";
  String RATEController = "";
  String MRPController = "";
  String MIDController = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    // controller: IDController,
                    onChanged: (text) {
                      IDController = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'NAME ',
                      hintText: 'Enter Your Name',
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
                      labelText: 'SHOP NAME',
                      hintText: 'ENTER YOUR SHOP NAME',
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
                      labelText: 'CONTACT NO ',
                      hintText: '+91 998******9',
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
                      labelText: 'LICENSE NO',
                      hintText: 'LICENSE',
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
                      labelText: 'ADDRESS',
                      hintText: 'Enter Address',
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
                    FirebaseFirestore.instance.collection('medicin').add(a);
                  },
                )
              ],
            )));
  }
}
