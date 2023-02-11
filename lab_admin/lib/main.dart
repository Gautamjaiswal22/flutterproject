// import 'package:admin_test/allproducts.dart';
// import 'package:admin_test/bill.dart';
import 'package:flutter/material.dart';
// import 'package:phone_otp_ui/phone.dart';
// import 'login/phone.dart';
// import 'package:phone_otp_ui/verify.dart';
// import 'login/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_admin/homepage.dart';
// import 'product/product_description.dart';
// import 'proimage.dart';
// import 'allproducts.dart';
// import 'lab.dart';
// import 'addpatient.dart';
// import 'dart:html';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'bill',
    debugShowCheckedModeBanner: false,
    routes: {
      // 'phone': (context) => MyPhone(),
      // 'verify': (context) => MyVerify(),
      'bill': (context) => MyHomePage(),
    },
  ));
}
