import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ds/users_orders_ds.dart';
import 'orders.dart';

class orders_user extends StatefulWidget {
  const orders_user({super.key});

  @override
  State<orders_user> createState() => _orders_userState();
}

class _orders_userState extends State<orders_user> {
  // final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("ORDERS"),
        ),
        body: StreamBuilder<List<Customer>>(
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

  Widget buildUser(Customer user) => GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => orders())),
      child: Card(
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
                  ],
                ),
              ))
            ],
          ),
        ),
      ));

  Stream<List<Customer>> readUsers() => FirebaseFirestore.instance
      .collection("bill")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Customer.fromJson(doc.data())).toList());
}

class Customer {
  final String name;

  Customer({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
      };
  static Customer fromJson(Map<String, dynamic> json) => Customer(
        name: json['name'],
      );
}
