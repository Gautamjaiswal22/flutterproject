import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';

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
                .collection('medicines')
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
                    return Card(
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
                                      data['name'],
                                      // user.name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("MRP : ₹ " + data['MRP'],
                                        // user.mrp.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text("RATE : ₹ " + data['RATE'],
                                        // user.rate.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),

//-------in one row-----
                                  Container(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(children: <Widget>[
                                          Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IconButton(
                                                    onPressed: () {
                                                      // final docuser =
                                                      //     FirebaseFirestore
                                                      //         .instance
                                                      //         .collection(
                                                      //             'cart')
                                                      //         .doc(
                                                      //             '${user.mid}');
                                                      // if (user.itemcount > 1) {
                                                      //   var decrement =
                                                      //       user.itemcount - 1;
                                                      //   docuser.update({
                                                      //     'itemcount':
                                                      //         decrement,
                                                      //   });
                                                      // } else {
                                                      //   docuser.update({
                                                      //     'itemcount': 1,
                                                      //   });
                                                      // }

                                                      //update
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove))),
                                          ),

                                          //-----------count show----
                                          Container(
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: CircleAvatar(
                                                  child: Text("5"),
                                                )),
                                          ),

                                          Container(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IconButton(
                                                    onPressed: () {
                                                      // final docuser =
                                                      //     FirebaseFirestore
                                                      //         .instance
                                                      //         .collection(
                                                      //             'cart')
                                                      //         .doc(
                                                      //             '${user.mid}');
                                                      // var incre =
                                                      //     user.itemcount + 1;
                                                      // docuser.update({
                                                      //   'itemcount': incre,
                                                      // });

                                                      //update
                                                    },
                                                    icon:
                                                        const Icon(Icons.add))),
                                          ),
                                          // ),

                                          // Expanded(
                                          //   child: Container(
                                          //     color: Colors.orange,
                                          //     height: 20,
                                          //     width: 20,
                                          //   ),
                                          // ),

                                          //----delete button-------
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 245, 4, 4),
                                                    //alignment: Alignment.centerRight
                                                  ),
                                                  onPressed: () {
                                                    // final docuser =
                                                    //     FirebaseFirestore
                                                    //         .instance
                                                    //         .collection('cart')
                                                    //         .doc('10');
                                                    // docuser.delete();
                                                  },
                                                  child: const Text(
                                                      'ADD TO CART')),
                                            ),
                                          ),
                                        ])),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}



//-------------------------------------------

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:medico/ProductDataModel.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:http/http.dart' as http;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';

// import 'cart.dart';
// import 'clouditem.dart';
// import 'main.dart';

// //to return on main page again

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: "todo app",
// //       theme: ThemeData(
// //         primaryColor: Colors.greenAccent[700],
// //       ),
// //       home: Home(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }
// adddata() {
//   DatabaseReference ref = FirebaseDatabase.instance.reference();

//   ref.set({
//     "name": "John",
//     "age": 18,
//     "address": {"line1": "100 Mountain View"}
//   });
// }

// // readdata() async {
// //   DatabaseReference starCountRef =
// //       FirebaseDatabase.instance.reference().child('posts/starCount');
// //   starCountRef.onValue.listen((DatabaseEvent event) {
// //     final data = event.snapshot.value;
// //     updateStarCount(data);
// //   });
// // }

// List<dynamic> alldata() {
//   List<dynamic> products = [];

//   Future getProductsData() async {
//     final jsondataa = await rootBundle.rootBundle
//         .loadString('assets/jsonfile/productlist.json');
//     final jsonData = json.decode(jsondataa) as List<dynamic>;

//     for (int i = 0; i < jsonData.length; i++) {
//       List<dynamic> prodinfo = [];
//       //print("before adding " + jsonData[i]['name']);
//       //products.add(jsonData[i]['name']);
//       //products.add(jsonData[i]);
//       prodinfo.add(jsonData[i]['id']);
//       prodinfo.add(jsonData[i]['name']);
//       prodinfo.add(jsonData[i]['oldPrice']);
//       prodinfo.add(jsonData[i]['price']);
//       prodinfo.add(jsonData[i]["imageUrl"]);
//       products.add(prodinfo);
//       //print("After adding " + products[i]);
//     }
//     // print(products);
//   }

//   adddata();

//   getProductsData();
//   return products;
// }

// class searchProducts extends SearchDelegate<String> {
//   //--------------------------------------------real time crud------------------------------

//   //-------------------------------------------------------------------------------------
//   //List<dynamic> products = [];
//   List<dynamic> products = alldata();
//   List<dynamic> matchQueryres = [];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       //tooltip: 'Back',
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         //query = "gautam";
//         MyHomePage();
//         close(context, "a");
//         //Take control back to previous page
//         //this.close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // return Text("Returned");

  //   return ListView.builder(
  //       //itemCount: items == null ? 0 : matchQuery.length,
  //       itemCount: matchQueryres == null ? 0 : matchQueryres.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           elevation: 5,
  //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   width: 50,
  //                   height: 50,
  //                   child: Image(
  //                     image: NetworkImage(matchQueryres[index][4].toString()),
  //                     fit: BoxFit.fill,
  //                   ),
  //                 ),
  //                 Expanded(
  //                     child: Container(
  //                   padding: EdgeInsets.only(bottom: 8),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text(
  //                           matchQueryres[index][1],
  //                           //matchQuery[index].name.toString(),
  //                           style: TextStyle(
  //                               fontSize: 16, fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text("MRP : " + products[index][2].toString(),
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.bold)),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text(
  //                             " RATE : " + products[index][3].toString(),
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.bold)),
  //                       ),
  //                       //-----------cart button
  //                       Container(
  //                         child: Align(
  //                           alignment: Alignment.centerRight,
  //                           child: ElevatedButton(
  //                               style: ElevatedButton.styleFrom(
  //                                 primary: Color.fromARGB(255, 15, 183, 3),
  //                                 //alignment: Alignment.centerRight
  //                               ),
  //                               onPressed: () {
  //                                 //---------to firebase
  //                                 final user = Products(
  //                                   mid: products[index][0].toInt(),
  //                                   name: products[index][1].toString(),
  //                                   mrp: int.parse(products[index][2]),
  //                                   rate: int.parse(products[index][3]),
  //                                   itemcount: 1,
  //                                 );
  //                                 createUser(user);

  //                                 //-----------------

  //                                 //saveData(index);
  //                                 // cart.add(products[index]);
  //                                 // print("index");
  //                                 // print(index);
  //                                 // print(products[index]);
  //                               },
  //                               child: const Text('Add to Cart')),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ))
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<dynamic> matchQuery = [];
//     List<dynamic> cart = [];
//     print('products--------------------------------------');
//     print(products);

//     print('l/////////////////////////////////////////////////////////////');

//     for (var searched in products) {
//       if (searched[1].toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(searched);
//         matchQueryres.add(searched);
//       }
//     }
  //   print('matchquery++++++++++++++++++++++++++++++++++++');
  //   print(matchQuery);
  //   return ListView.builder(
  //       //itemCount: items == null ? 0 : matchQuery.length,
  //       itemCount: matchQuery == null ? 0 : matchQuery.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           elevation: 5,
  //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   width: 50,
  //                   height: 50,
  //                   child: Image(
  //                     image: NetworkImage(matchQuery[index][4].toString()),
  //                     fit: BoxFit.fill,
  //                   ),
  //                 ),
  //                 Expanded(
  //                     child: Container(
  //                   padding: EdgeInsets.only(bottom: 8),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text(
  //                           matchQuery[index][1],
  //                           //matchQuery[index].name.toString(),
  //                           style: TextStyle(
  //                               fontSize: 16, fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text("MRP : " + products[index][2].toString(),
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.bold)),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(left: 8, right: 8),
  //                         child: Text(
  //                             " RATE : " + products[index][3].toString(),
  //                             style: TextStyle(
  //                                 fontSize: 16, fontWeight: FontWeight.bold)),
  //                       ),
  //                       //-----------cart button
  //                       Container(
  //                         child: Align(
  //                           alignment: Alignment.centerRight,
  //                           child: ElevatedButton(
  //                               style: ElevatedButton.styleFrom(
  //                                 primary: Color.fromARGB(255, 15, 183, 3),
  //                                 //alignment: Alignment.centerRight
  //                               ),
  //                               onPressed: () {
  //                                 //---------to firebase
  //                                 final user = Products(
  //                                   mid: products[index][0].toInt(),
  //                                   name: products[index][1].toString(),
  //                                   mrp: int.parse(products[index][2]),
  //                                   rate: int.parse(products[index][3]),
  //                                   itemcount: 1,
  //                                 );
  //                                 createUser(user);

  //                                 //-----------------

  //                                 //saveData(index);
  //                                 // cart.add(products[index]);
  //                                 // print("index");
  //                                 // print(index);
  //                                 // print(products[index]);
  //                               },
  //                               child: const Text('Add to Cart')),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ))
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

//   Future createUser(Products user) async {
//     final docUser =
//         FirebaseFirestore.instance.collection("cart").doc(user.mid.toString());
//     // final json1 = {'name': name, 'age': 21, 'birthday': DateTime(2002, 5, 22)};

//     user.id = docUser.id;
//     //user.id = user.mid.toString();
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }
