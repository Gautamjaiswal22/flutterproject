import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab/lab.dart';
// import 'package:http/http.dart';
// import 'clouditem.dart';
import 'ds/bill_ds.dart';
// import 'cart.dart';
import 'homepage.dart';

class billpage extends StatefulWidget {
  // const billpage({super.key});
  // final String NameController;
  // final TestPage transModel;
  final String transModel;
  billpage({required this.transModel});

  @override
  _billpageState createState() => _billpageState();

  // const billpage({super.key, required this.NameController});

  // @override
  // State<billpage> createState() => _billpageState(this.transModel);
  // _TranslatorSignUpStep2State createState() => _TranslatorSignUpStep2State(this.transModel);

}

class _billpageState extends State<billpage> {
  final controller = TextEditingController();
  // late String username = widget.transModel;
  late String username;

  billpage() {
    username = widget.transModel;
  }
  // TranslatorModel _translatorModel ;
  // late String username = widget.NameController;

  // @override
  // void initState() {
  //   username = widget.NameController;
  // }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("BILLING"),
        ),
        body: SingleChildScrollView(
          child: new Container(
            // color: Color.fromARGB(255, 98, 100, 102),
            height: 900.0,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  // color: Color.fromARGB(255, 66, 11, 11),
                  height: 200.0,
                  // alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //     child: SizedBox(
                      //   height: 20,
                      // )),
                      Container(
                        height: 200,
                        // controller: controller,
                        child: StreamBuilder<List<Products>>(
                            stream: readAddress(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                    "Something went Wrong ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                final users = snapshot.data!;
                                return ListView(
                                    shrinkWrap: true,
                                    children: users.map(buildAdd).toList());
                                // return Text("data found");
                              } else {
                                // return Text(" data not found");
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                //------------------------------list------

                Container(
                  color: Color.fromARGB(255, 247, 249, 247),
                  height: 350.0,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'TEST DESCRIPTION ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Aleo',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 11, 4, 4)),
                        ),
                      ),
                      Container(
                          child: ListView(shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              children: <Widget>[
                            ListTile(
                              title: Text(
                                  'S.No   Product Name    Quantity    Rate     Total',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ])),
                      Container(
                        height: 200,
                        // controller: controller,
                        child: StreamBuilder<List<test>>(
                            stream: readUsers(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                    "Something went Wrong ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                final users = snapshot.data!;
                                return ListView(
                                    shrinkWrap: true,
                                    children: users.map(buildUser).toList());
                                // return Text("data found");
                              } else {
                                // return Text(" data not found");
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                      Container(
                          child: ListView(shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              children: <Widget>[
                            ListTile(
                              title: Text('        Total 10000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ])),
                    ],
                  ),
                ),

                Container(
                  // color: Color.fromARGB(255, 175, 9, 9),
                  height: 80.0,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          child: Text(
                            'CONTINUE TO PAYMENT',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          color: Color.fromARGB(255, 0, 206, 34),
                          textColor: Colors.white,
                          onPressed: () {
                            print("button");
                            getDETAIL();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdd(Products user) => Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(3),
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
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "PATIENT DETAILS",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Patient name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.name.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "age :" + user.age.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.address.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.Mobile.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.gender.toString(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );

  Stream<List<Products>> readAddress() => FirebaseFirestore.instance
      .collection('user')
      .doc("jaiswal")
      .collection("patient1")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());

  Widget buildUser(test user) => Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(3),
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
                                    child: SizedBox(
                                      height: 20,
                                      width: 40,
                                    )),
                              ),
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
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 20,
                                      width: 30,
                                    )),
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    user.rate.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                    )),
                              ),
                              Container(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                    )),
                              ),
                            ])),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );

  Stream<List<test>> readUsers() => FirebaseFirestore.instance
      .collection('user')
      .doc("jaiswal")
      .collection(widget.transModel)
      .doc("detail")
      .collection("test")
      //.where('name', isEqualTo: "PARACETAMOL")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => test.fromJson(doc.data())).toList());

  //-------------------------------------update to admin---

  late CollectionReference _collectionRef = FirebaseFirestore.instance
      .collection('user')
      .doc("jaiswal")
      .collection(widget.transModel)
      .doc("detail")
      .collection("test");
  getDETAIL() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    var z = allData;
    print(allData);
    var data = new List.filled(allData.length, "a");
    for (var i = 0; i < z.length; i++) {
      data[i] = allData[i].toString();
    }
    var data1 = new List.filled(allData.length, []);
    for (var i = 0; i < z.length; i++) {
      data[i] = data[i].substring(1, data[i].length - 1);
      var j = data[i].split(",");
      // print(j);
      data1[i] = j;
      data1[i].sort();
      // print(data1[i]);
    }
    // print(data[0][1]);
    // print(data1);
    print("gautam jasiwal");
    print(data1);

    for (var i = 0; i < z.length; i++) {
      // print(data1[i][5]);
      // print(data1[i][6].substring(
      // 8,
      // ));

      var a = {
        "id": data1[i][0].substring(
          5,
        ),
        "name": data1[i][1].substring(
          7,
        ),
        "rate": int.parse(data1[i][2].substring(
          7,
        )),
      };
      print("a");
      print(a);

      FirebaseFirestore.instance
          .collection('bill')
          .doc("JAISWAL")
          .collection("order")
          .doc(widget.transModel)
          .collection("BILL")
          .doc("${a['id']}")
          .set(a);
    }

    var b = {'name': widget.transModel};
    FirebaseFirestore.instance
        .collection('bill')
        .doc("JAISWAL")
        .collection("order")
        .doc(widget.transModel)
        .set(b);

    print("all done");

    // return allData;
    // var z = allData[0];
    // var y = z.toString();
    // y = y.substring(1, y.length - 1);
    // print(y);
    // print(y.runtimeType);
    // var j = y.split(",");
    // print(j[1]);
  }
}
