// import 'dart:async';
// import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:medico/ProductDataModel.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'clouditem.dart';
import 'bill.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => UserPage()));
      //   },
      // ),
      // ElevatedButton(
      //   child: Text('Elevated Button'),
      //   style: ElevatedButton.styleFrom(
      //     primary: Colors.green,
      //   ),
      //   onPressed: () {},
      // ),
      floatingActionButton: Container(
          height: 80,
          width: 80,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                // final docuser = FirebaseFirestore.instance
                //     .collection('bill')
                //     .doc('${user.mid}');
                // var incre = user.itemcount + 1;
                // var total_amount = incre * user.rate;
                // docuser.update({
                //   'itemcount': incre,
                //   "total": total_amount,
                // // });
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => billpage()));
              },
              tooltip: 'payment',
              child: Icon(Icons.payment),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                // child: const Icon(Icons.shopping_cart),
              ),
            ),
          )));

  // Widget buildUser(Products user) => ListTile(
  //       leading: CircleAvatar(child: Text('${user.mid}')),
  //       title: Text(user.name),
  //       subtitle: Text('MRP : ${user.mrp} RATE : ${user.rate}'),
  //     );

  Widget buildUser(Products user) => Card(
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
                      child: Text("MRP : ₹ " + user.mrp.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("RATE : ₹ " + user.rate.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("TOTAL : ₹ " + user.total.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),

//-------in one row-----
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(children: <Widget>[
                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        final docuser = FirebaseFirestore
                                            .instance
                                            .collection('USERS')
                                            .doc("GAUTAM")
                                            .collection("CART")
                                            .doc('${user.mid}');
                                        if (user.itemcount > 1) {
                                          var decrement = user.itemcount - 1;
                                          var total_amount =
                                              decrement * user.rate;
                                          docuser.update({
                                            'itemcount': decrement,
                                            'total': total_amount,
                                          });
                                        } else {
                                          docuser.update({
                                            'itemcount': 1,
                                          });
                                        }

                                        //update
                                      },
                                      icon: const Icon(Icons.remove))),
                            ),

                            //-----------count show----
                            Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    child: Text("${user.itemcount}"),
                                  )),
                            ),

                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        final docuser = FirebaseFirestore
                                            .instance
                                            .collection('USERS')
                                            .doc("GAUTAM")
                                            .collection("CART")
                                            .doc('${user.mid}');
                                        var incre = user.itemcount + 1;
                                        var total_amount = incre * user.rate;
                                        docuser.update({
                                          'itemcount': incre,
                                          "total": total_amount,
                                        });

                                        //update
                                      },
                                      icon: const Icon(Icons.add))),
                            ),
                            // ),

                            //----delete button-------
                            Container(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 245, 4, 4),
                                      //alignment: Alignment.centerRight
                                    ),
                                    onPressed: () {
                                      final docuser = FirebaseFirestore.instance
                                          .collection('USERS')
                                          .doc("GAUTAM")
                                          .collection("CART")
                                          .doc('${user.mid}');
                                      docuser.delete();
                                    },
                                    child: const Text('Remove')),
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

  Stream<List<Products>> readUsers() => FirebaseFirestore.instance
      .collection("USERS")
      .doc("GAUTAM")
      .collection("CART")
      // .where('name', isEqualTo: "PARACETAMOL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
