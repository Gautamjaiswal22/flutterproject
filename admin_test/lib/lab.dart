// // main.dart
import 'package:flutter/material.dart';
import 'labitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'dart:html';

// // Multi Select widget
// // This widget is reusable
// class MultiSelect extends StatefulWidget {
//   final List<String> items;
//   const MultiSelect({Key? key, required this.items}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   // this variable holds the selected items
//   final List<String> _selectedItems = [];

// // This function is triggered when a checkbox is checked or unchecked
//   void _itemChange(String itemValue, bool isSelected) {
//     setState(() {
//       if (isSelected) {
//         _selectedItems.add(itemValue);
//       } else {
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }

//   // this function is called when the Cancel button is pressed
//   void _cancel() {
//     Navigator.pop(context);
//   }

// // this function is called when the Submit button is tapped
//   void _submit() {
//     Navigator.pop(context, _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Topics'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//                     value: _selectedItems.contains(item),
//                     title: Text(item),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (isChecked) => _itemChange(item, isChecked!),
//                   ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: _cancel,
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: _submit,
//           child: const Text('Submit'),
//         ),
//       ],
//     );

//   }
// }

// // Implement a multi select on the Home screen
// class Lab extends StatefulWidget {
//   const Lab({Key? key}) : super(key: key);

//   @override
//   State<Lab> createState() => _LabState();
// }

// class _LabState extends State<Lab> {
//   List<String> _selectedItems = [];
//   bool value = false;

//   void _showMultiSelect() async {
//     // a list of selectable items
//     // these items can be hard-coded or dynamically fetched from a database/API
//     final List<String> items = [
//       'Flutter',
//       'Node.js',
//       'React Native',
//       'Java',
//       'Docker',
//       'MySQL',
//       'Flutter',
//       'Node.js',
//       'React Native',
//       'Java',
//       'Docker',
//       'MySQL',
//       'Flutter',
//       'Node.js',
//       'React Native',
//       'Java',
//       'Docker',
//       'MySQL'
//     ];
//     print(Products(name: "name"));

//     final List<String>? results = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MultiSelect(items: items);
//       },
//     );

//     // Update UI
//     if (results != null) {
//       setState(() {
//         _selectedItems = results;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('dbestech'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // use this button to open the multi-select dialog
//             ElevatedButton(
//               onPressed: _showMultiSelect,
//               child: const Text('Select test'),
//             ),
//             const Divider(
//               height: 30,
//             ),
//             // display selected items
//             Wrap(
//               children: _selectedItems
//                   .map((e) => Chip(
//                         label: Text(e),
//                       ))
//                   .toList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildUser(Products user) => Card(
//       elevation: 5,
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       child: Container(
//         padding: EdgeInsets.all(8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                   padding: EdgeInsets.only(bottom: 8),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 8, right: 8),
//                           child: Text(
//                             user.name.toString(),
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 8, right: 8),
//                           child: Checkbox(
//                             value: this.value,
//                             onChanged: (bool) {},
//                           ),
//                         ),
//                       ])),
//             ),
//           ],
//         ),
//       ));

//   Stream<List<Products>> readUsers() => FirebaseFirestore.instance
//       .collection("USERS")
//       .doc("GAUTAM")
//       .collection("CART")
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:medico/ProductDataModel.dart';
// // import 'package:flutter/services.dart' as rootBundle;
// // import 'package:http/http.dart' as http;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'clouditem.dart';
// import 'bill.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("All Added Products"),
        ),
        body: StreamBuilder<List<Products>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went Wrong ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;
                return ListView(children: users.map(buildUser).toList());
                // return Text("data found");
              } else {
                // return Text(" data not found");
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

  Widget buildUser(Products user) => Card(
        // var val=10;
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        user.name.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        user.v.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Checkbox(
                        checkColor: Colors.greenAccent,
                        activeColor: Colors.red,
                        value: user.check,
                        onChanged: (bool? value) => {
                          setState(() {
                            print("chnaged");
                            print(value);
                            this.valuefirst = value!;

                            final docuser = FirebaseFirestore.instance
                                .collection('lab')
                                .doc('${user.id}');
                            docuser.update({
                              'check': value,
                            });
                            var a = {
                              "id": value,
                              "name": user.name,
                            };

                            FirebaseFirestore.instance
                                .collection('test')
                                .add(a);
                          }),
                        },
                      ),
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                final docuser = FirebaseFirestore.instance
                                    .collection('lab')
                                    .doc('${user.id}');
                                var a = user.v + 1;
                                docuser.update({
                                  'v': a,
                                });
                                //update
                              },
                              icon: const Icon(Icons.add))),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );

  Stream<List<Products>> readUsers() => FirebaseFirestore.instance
      .collection("lab")
      // .where('name', isEqualTo: "PARACETAMOL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
