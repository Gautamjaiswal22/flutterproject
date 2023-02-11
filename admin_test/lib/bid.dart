import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'clouditem.dart';
import 'cart.dart';

class bidpage extends StatefulWidget {
  const bidpage({super.key});

  @override
  State<bidpage> createState() => _bidpageState();
}

class _bidpageState extends State<bidpage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: AppBar(
            title: Text("All Added Products"),
          ),
          body: ListView(shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              children: <Widget>[
                ListTile(
                  title: Text(
                      'S.No  Product Name    Quantity       Rate        Total',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: StreamBuilder<List<Products>>(
                      stream: readUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went Wrong ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final users = snapshot.data!;
                          return ListView(
                              shrinkWrap: true,
                              children: users.map(buildUser).toList());
                          // return Text("data found");
                        } else {
                          // return Text(" data not found");
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
                ListTile(
                  title: Text(
                      'S.No  Product Name    Quantity       Rate        Total',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ])),
    );
  }

  Widget buildUser(Products user) => Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                // padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(children: <Widget>[
                              Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    user.name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  child: SizedBox(
                                width: 10,
                              )),
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    user.itemcount.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  child: SizedBox(
                                width: 40,
                              )),
                              Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    user.rate.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  child: SizedBox(
                                width: 40,
                              )),
                              Container(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    user.total.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ])),
                      ),
                      // Text(
                      //   user.name.toString() +
                      //       "     " +
                      //       user.mrp.toString() +
                      //       "    " +
                      //       user.rate.toString(),
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.bold),
                      // ),
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
      .collection("BILL")
      //.where('name', isEqualTo: "PARACETAMOL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
