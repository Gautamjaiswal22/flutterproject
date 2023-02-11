import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart.dart';
// import 'clouditem.dart';
// import 'package:medico/ProductDataModel.dart';
import 'searchbar.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //-----------------------------
  // List<dynamic> products = alldata();
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MEDICO - ADMIN ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: "Fredoka One"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CloudFirestoreSearch()));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainPage()));
        },
        tooltip: 'cart',
        child: const Icon(Icons.shopping_cart),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "GAUTAM",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("GAUTAMJAISWAL@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "G",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' CUSTOMERS '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' PENDING ORDERS '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining_rounded),
              title: const Text(' DELIVERED ORDERS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('TEAM'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' ALL PRODUCTS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' DATA MANAGEMENT '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
