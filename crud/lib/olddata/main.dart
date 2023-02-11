import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crud/main1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'dart:async';
// import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:medico/ProductDataModel.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:http/http.dart' as http;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'clouditem.dart';
// import 'package:crud/firestoresearch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEDICINE SHOPPING APPLICATION',
      //theme: ThemeData(fontFamily: 'FredokaOne'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Fredoka One',
      ),
      home: CloudFirestoreSearch(),
    );
  }
}

class CloudFirestoreSearch extends StatefulWidget {
  // const CloudFirestoreSearch({super.key});

  @override
  State<CloudFirestoreSearch> createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Card(
              // color: Colors.red,
              child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "search..."),
        onChanged: (val) {
          setState(() {
            name = val;
          });
        },
      ))),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != '' && name != null)
            ? FirebaseFirestore.instance
                .collection('med')
                .where("name_array", arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection('med').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(data['name'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.shopping_basket,
                                color: Colors.red, size: 30),
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CloudFirestoreSearch(),
//     ),
//   );
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   Widget build(BuildContext context) {

//   return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "MEDICO ",
//           style: TextStyle(
//               color: Colors.black, fontSize: 20, fontFamily: "Fredoka One"),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => MainPage()));
//         },
//         tooltip: 'cart',
//         child: const Icon(Icons.search
//       ),
      
//     );
//   }
// }

// // class FirebaseSearchScreen extends StatefulWidget {
// //   const FirebaseSearchScreen({Key? key}) : super(key: key);

// //   @override
// //   State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
// // }

// // class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
// //   List searchResult = [];

// //   void searchFromFirebase(String query) async {
// //     final result = await FirebaseFirestore.instance
// //         .collection('MED')
// //         .where('name', isEqualTo: query)
// //         .get();

// //     setState(() {
// //       searchResult = result.docs.map((e) => e.data()).toList();
// //       print(searchResult);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Firebase Search"),
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(15.0),
// //             child: TextField(
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 hintText: "Search Here",
// //               ),
// //               onChanged: (query) {
// //                 searchFromFirebase(query);
// //               },
// //             ),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: searchResult.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(searchResult[index]['id']),
// //                   subtitle: Text(searchResult[index]['name']),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final controller = TextEditingController();
//   final seaitem = TextEditingController();
//   String dataaa = "gau";
//   List searchResult = [];

//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter TextField Example'),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(15),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'User Name',
//                       hintText: 'Enter Your Name',
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                       hintText: 'Enter Password',
//                     ),
//                   ),
//                 ),
//                 FloatingActionButton: FloatingActionButton(
//       elevation: 10.0,
//       child: const Icon(Icons.add),
//       onPressed: () {
//         // action on button press
//       },
//     ),
//                 // RaisedButton(
//                 //   textColor: Colors.white,
//                 //   color: Colors.blue,
//                 //   child: Text('Sign In'),
//                 //   onPressed: () {
//                 //     return showDialog(
//                 //       context: context,
//                 //       builder: (context) {
//                 //         return AlertDialog(
//                 //           title: Text("Alert Message"),
//                 //           // Retrieve the text which the user has entered by
//                 //           // using the TextEditingController.
//                 //           content: Text(nameController.text),
//                 //           actions: <Widget>[
//                 //             new FlatButton(
//                 //               child: new Text('OK'),
//                 //               onPressed: () {
//                 //                 Navigator.of(context).pop();
//                 //               },
//                 //             )
//                 //           ],
//                 //         );
//                 //       },
//                 //     );
//                 //   },
//                 // )
//               ],
//             )));
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: <Widget>[
//   //       const Padding(
//   //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//   //         child: TextField(
//   //           decoration: InputDecoration(
//   //             border: OutlineInputBorder(),
//   //             hintText: 'Enter a search term',
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }

//   // // void searchFromFirebase(String query) async {
//   // //   // final result = await FirebaseFirestore.instance
//   // //   //     .collection('MED')
//   // //   //     .where('name', isEqualTo: query)
//   // //   //     .get();

//   // //   setState(() {
//   // //     searchResult = result.docs.map((e) => e.data()).toList();
//   // //     print(searchResult);
//   // //   });
//   // // }

//   // @override
//   // Widget build(BuildContext context) => Scaffold(
//   //       appBar: AppBar(
//   //         title: Text("All Added Products"),
//   //       ),
//   //       body: StreamBuilder<List<Products>>(
//   //           stream: readUsers(dataaa),
//   //           builder: (context, snapshot) {
//   //             if (snapshot.hasError) {
//   //               return Text("Something went Wrong ${snapshot.error}");
//   //             } else if (snapshot.hasData) {
//   //               final users = snapshot.data!;
//   //               print(
//   //                   "data found+++++++++++++++++++++++++++++++++++++++++++++++");

//   //               return ListView(children: users.map(buildUser).toList());
//   //               // return Text("data found");
//   //             } else {
//   //               // return Text(" data not found");
//   //               print(
//   //                   "not found*****************************************************");
//   //               return Center(child: CircularProgressIndicator());
//   //             }
//   //           }),
//   //     );
//   // // );
//   // // );

//   // // Widget buildUser(Products user) => ListTile(
//   // //       leading: CircleAvatar(child: Text('${user.mid}')),
//   // //       title: Text(user.name),
//   // //       subtitle: Text('MRP : ${user.mrp} RATE : ${user.rate}'),
//   // //     );

//   // Widget buildUser(Products user) => Card(
//   //       elevation: 5,
//   //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//   //       child: Container(
//   //         padding: EdgeInsets.all(8),
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           crossAxisAlignment: CrossAxisAlignment.center,
//   //           children: [
//   //             Expanded(
//   //                 child: Container(
//   //               padding: EdgeInsets.only(bottom: 8),
//   //               child: Column(
//   //                 mainAxisAlignment: MainAxisAlignment.center,
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Padding(
//   //                     padding: EdgeInsets.only(left: 8, right: 8),
//   //                     child: Text(
//   //                       user.name.toString(),
//   //                       style: TextStyle(
//   //                           fontSize: 16, fontWeight: FontWeight.bold),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ))
//   //           ],
//   //         ),
//   //       ),
//   //     );

//   // Stream<List<Products>> readUsers(String que) => FirebaseFirestore.instance
//   //     .collection("med")
//   //     .where('name_array', arrayContains: que)
//   //     .snapshots()
//   //     .map((snapshot) =>
//   //         snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
// }

// showdata(String dataaa) {
//   Widget buildUser(Products user) => Card(
//         elevation: 5,
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         child: Container(
//           padding: EdgeInsets.all(8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: Container(
//                 padding: EdgeInsets.only(bottom: 8),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 8, right: 8),
//                       child: Text(
//                         user.name.toString(),
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ))
//             ],
//           ),
//         ),
//       );

//   Stream<List<Products>> readUsers(String que) => FirebaseFirestore.instance
//       .collection("med")
//       .where('name_array', arrayContains: que)
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text("All Added Products"),
//         ),
//         body: StreamBuilder<List<Products>>(
//             stream: readUsers(dataaa),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Text("Something went Wrong ${snapshot.error}");
//               } else if (snapshot.hasData) {
//                 final users = snapshot.data!;
//                 print(
//                     "data found+++++++++++++++++++++++++++++++++++++++++++++++");

//                 return ListView(children: users.map(buildUser).toList());
//                 // return Text("data found");
//               } else {
//                 // return Text(" data not found");
//                 print(
//                     "not found*****************************************************");
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
//       );
//   // );
//   // );

//   // Widget buildUser(Products user) => ListTile(
//   //       leading: CircleAvatar(child: Text('${user.mid}')),
//   //       title: Text(user.name),
//   //       subtitle: Text('MRP : ${user.mrp} RATE : ${user.rate}'),
//   //     );

//   // Widget buildUser(Products user) => Card(
//   //       elevation: 5,
//   //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//   //       child: Container(
//   //         padding: EdgeInsets.all(8),
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           crossAxisAlignment: CrossAxisAlignment.center,
//   //           children: [
//   //             Expanded(
//   //                 child: Container(
//   //               padding: EdgeInsets.only(bottom: 8),
//   //               child: Column(
//   //                 mainAxisAlignment: MainAxisAlignment.center,
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Padding(
//   //                     padding: EdgeInsets.only(left: 8, right: 8),
//   //                     child: Text(
//   //                       user.name.toString(),
//   //                       style: TextStyle(
//   //                           fontSize: 16, fontWeight: FontWeight.bold),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ))
//   //           ],
//   //         ),
//   //       ),
//   //     );

//   // Stream<List<Products>> readUsers(String que) => FirebaseFirestore.instance
//   //     .collection("med")
//   //     .where('name_array', arrayContains: que)
//   //     .snapshots()
//   //     .map((snapshot) =>
//   //         snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
// }
