import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'allpro_ds.dart';
import 'pro_desc_ds.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Product_description extends StatefulWidget {
  const Product_description({super.key});

  @override
  State<Product_description> createState() => _Product_descriptionState();
}

class _Product_descriptionState extends State<Product_description> {
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
                    // Padding(
                    //     padding: EdgeInsets.only(left: 8, right: 8),
                    //     child: Image.network(image['url'])),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        user.name.toString(),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("MRP : ₹ " + user.MRP.toString(),
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("RATE : ₹ " + user.RATE.toString(),
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(children: <Widget>[
                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        // final docuser =
                                        //     FirebaseFirestore
                                        //         .instance
                                        //         .collection(
                                        //             'cart')
                                        //         .doc(
                                        //             '${data.mid}');
                                        // if (data.itemcount > 1) {
                                        //   var decrement =
                                        //       data.itemcount - 1;
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
                                      icon: const Icon(Icons.remove))),
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
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        // var itemcount=1;
                                        // final docuser =
                                        //     FirebaseFirestore
                                        //         .instance
                                        //         .collection(
                                        //             'cart')
                                        //         .doc(
                                        //             '${data.mid}');
                                        // var incre =
                                        //     itemcount + 1;
                                        // docuser.update({
                                        //   'itemcount': incre,
                                        // });
                                        // update
                                      },
                                      icon: const Icon(Icons.add))),
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
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 245, 4, 4),
                                      //alignment: Alignment.centerRight
                                    ),
                                    onPressed: () {
//                                                     final docUser =
// //         FirebaseFirestore.instance.collection("cart").doc(user.mid.toString());
                                      // final docuser = FirebaseFirestore.instance
                                      //     .collection('USERS')
                                      //     .doc("GAUTAM")
                                      //     .collection("CART")
                                      //     .doc(data.id.toString());
                                      // docuser.set({
                                      //   'name': "${data[name]}",
                                      //   "mid": "${data['id']}",
                                      // }
                                      // );
                                    },
                                    child: const Text('ADD TO CART')),
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
      .collection("medicines")
      .where("name", isEqualTo: "paracetamol")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
