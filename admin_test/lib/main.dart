// import 'package:admin_test/addtobill.dart';
// import 'package:admin_test/allproducts.dart';
// import 'package:flutter/material.dart';
// import 'cart.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import "searchbar.dart";
// import 'addmedicines.dart';
// import 'bill.dart';
// import 'bid.dart';
// import 'addtobill.dart';
// import 'orders.dart';
// import 'user_order.dart';
// // import 'image.dart';
// import 'proimage.dart';
// import 'userdata/userdetail.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'admin test',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const adduser(),

//       // home: const MyHomePage(title: 'medico test'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // method to show the search bar
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => CloudFirestoreSearch()));
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//       body: Center(
//         child: FlatButton(
//           child: Text(
//             'LogIn',
//             style: TextStyle(fontSize: 20.0),
//           ),
//           color: Colors.blueAccent,
//           textColor: Colors.white,
//           onPressed: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => imagePage()));
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => billpage()));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:admin_test/allproducts.dart';
import 'package:admin_test/bill.dart';
import 'package:flutter/material.dart';
// import 'package:phone_otp_ui/phone.dart';
import 'login/phone.dart';
// import 'package:phone_otp_ui/verify.dart';
import 'login/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'product/product_description.dart';
// import 'proimage.dart';
// import 'allproducts.dart';
import 'lab.dart';
// import 'dart:html';
import 'bill.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'bill',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'bill': (context) => billpage(),
    },
  ));
}
