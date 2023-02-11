import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'allpro_ds.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  // final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("All Added Products"),
        ),
        body: StreamBuilder<List<Products>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went Wrong GAUTAM \n ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return SafeArea(
                    child: Scaffold(
                        body: Container(
                            height: 150,
                            child: ListView(
                              children: users.map(buildUser).toList(),
                              // scrollDirection: Axis.horizontal,
                            ))));
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
                      child: Text("MRP : ₹ " + user.MRP.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("RATE : ₹ " + user.RATE.toString(),
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
      .collection("medicines")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
