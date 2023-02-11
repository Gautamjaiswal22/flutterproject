// import 'package:flutter/material.dart';
// // import 'package:phone_otp_ui/phone.dart';
// import 'phone.dart';
// // import 'package:phone_otp_ui/verify.dart';
// import 'verify.dart';

// void main() {
//   runApp(MaterialApp(
//     initialRoute: 'phone',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'phone': (context) => MyPhone(),
//       'verify': (context) => MyVerify()
//     },
//   ));
// }

import 'package:admin_test/bill.dart';
import 'package:flutter/material.dart';
// import 'package:phone_otp_ui/phone.dart';
import 'login/phone.dart';
// import 'package:phone_otp_ui/verify.dart';
import 'login/verify.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'bill': (context) => billpage()
    },
  ));
}
