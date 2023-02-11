import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'clouditem.dart';
import 'cart.dart';

class billpage extends StatefulWidget {
  const billpage({super.key});

  @override
  State<billpage> createState() => _billpageState();
}

class _billpageState extends State<billpage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("FINAL BILL"),
      ),
      body: StreamBuilder<List<Products>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went Wrong ${snapshot.error}");
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(children: users.map(buildUser).toList());
              return Text("data found");
            } else {
              // return Text(" data not found");
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: Container(
          height: 80,
          width: 80,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MainPage()));
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

  Widget buildUser(Products user) => Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("data"),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 100),
                      child: Text(
                        user.name.toString() +
                            "     " +
                            user.mrp.toString() +
                            "    " +
                            user.rate.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );

  // Stream<List<Products>> readUsers() => FirebaseFirestore.instance
  //     .collection("bill")
  //     //.where('name', isEqualTo: "PARACETAMOL")
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());

  Stream<List<Products>> readUsers() => FirebaseFirestore.instance
      .collection("USERS")
      .doc("GAUTAM")
      .collection("BILL")
      //.where('name', isEqualTo: "PARACETAMOL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
