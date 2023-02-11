import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ds/orders_ds.dart';

class orders extends StatefulWidget {
  final String patientname;
  // billpage({required this.transModel});
  const orders({super.key, required this.patientname});
  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  // final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("ORDERS"),
        ),
        body: StreamBuilder<List<Products>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went Wrong GAUTAM \n ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(children: users.map(buildUser).toList());
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );

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
                      child: Text("RATE : ₹ " + user.rate.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );

  Stream<List<Products>> readUsers() => FirebaseFirestore.instance
      .collection("bill")
      .doc("JAISWAL")
      .collection("order")
      .doc(widget.patientname)
      .collection("BILL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
