import 'dart:async';

import 'package:crud/fetch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'addnote.dart';
import 'update_record.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "todo app",
//       theme: ThemeData(
//         primaryColor: Colors.greenAccent[700],
//       ),
//       home: Home(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// //---------------------------------stateless-------------------

// //---------------------------------------------------------

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Query dbRef = FirebaseDatabase.instance.ref().child('medicines');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('medicines');

  Widget listItem({required Map student}) {
    print(student);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      // height: 110,
      color: Color.fromARGB(255, 235, 248, 237),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NAME:" + student['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "PRICE : " + student['price'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (_) =>
                //               UpdateRecord(studentKey: student['key'])));
                // },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(student['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetching data'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map student = snapshot.value as Map;
              student['key'] = snapshot.key;
              return listItem(student: student);
            },
          ),
        ));
  }

  //-----------------------------------------------------
//   final fb = FirebaseDatabase.instance;
//   TextEditingController second = TextEditingController();

//   TextEditingController third = TextEditingController();
//   var l;
//   var g;
//   var k;
//   @override
//   Widget build(BuildContext context) {
//     final ref = fb.ref().child('medicines'); // to fetch data

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.indigo[900],
//         onPressed: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               // builder: (_) => addnote(),
//               builder: (_) => FetchData(),
//             ),
//           );
//         },
//         child: Icon(
//           Icons.add,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text(
//           'Todos',
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: FirebaseAnimatedList(
//         query: ref,
//         shrinkWrap: true,
//         itemBuilder: (context, snapshot, animation, index) {
//           var v =
//               snapshot.value.toString(); // {subtitle: webfun, title: subscribe}

//           g = v.replaceAll(
//               RegExp("{|}|subtitle: |title: "), ""); // webfun, subscribe
//           g.trim();

//           l = g.split(','); // [webfun,  subscribe}]
//           l = new List.from(l.reversed);

//           // var medname = [];
//           // var i = 0;
//           // while (i < l.length) {
//           //   medname.add(l[2]);
//           // }

//           print('g');
//           print(g);
//           print(l);
//           print('medname**********');
//           // print(medname);

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 k = snapshot.key;
//               });

//               // showDialog(
//               //   context: context,
//               //   builder: (ctx) => AlertDialog(
//               //     title: Container(
//               //       decoration: BoxDecoration(border: Border.all()),
//               //       child: TextField(
//               //         controller: second,
//               //         textAlign: TextAlign.center,
//               //         decoration: InputDecoration(
//               //           hintText: 'title',
//               //         ),
//               //       ),
//               //     ),
//               //     content: Container(
//               //       decoration: BoxDecoration(border: Border.all()),
//               //       child: TextField(
//               //         controller: third,
//               //         textAlign: TextAlign.center,
//               //         decoration: InputDecoration(
//               //           hintText: 'sub title',
//               //         ),
//               //       ),
//               //     ),
//               //     actions: <Widget>[
//               //       MaterialButton(
//               //         onPressed: () {
//               //           Navigator.of(ctx).pop();
//               //         },
//               //         color: Color.fromARGB(255, 0, 22, 145),
//               //         child: Text(
//               //           "Cancel",
//               //           style: TextStyle(
//               //             color: Colors.white,
//               //           ),
//               //         ),
//               //       ),
//               //       MaterialButton(
//               //         onPressed: () async {
//               //           await upd();
//               //           Navigator.of(ctx).pop();
//               //         },
//               //         color: Color.fromARGB(255, 0, 22, 145),
//               //         child: Text(
//               //           "Update",
//               //           style: TextStyle(
//               //             color: Colors.white,
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // );
//             },
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                       color: Colors.white,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   tileColor: Colors.indigo[100],
//                   trailing: IconButton(
//                     icon: Icon(
//                       Icons.delete,
//                       color: Color.fromARGB(255, 255, 0, 0),
//                     ),
//                     onPressed: () {
//                       ref.child(snapshot.key!).remove();
//                     },
//                   ),
//                   title: Text(
//                     l[2],
//                     // 'dd',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     l[4],
//                     // 'dd',

//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   upd() async {
//     DatabaseReference ref1 = FirebaseDatabase.instance.ref("todos/$k");

// // Only update the name, leave the age and address!
//     await ref1.update({
//       "title": second.text,
//       "subtitle": third.text,
//     });
//     second.clear();
//     third.clear();
//   }
}
