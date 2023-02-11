import 'dart:async';

import 'package:crud/fetch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
// import 'addnote.dart';
import 'update_record.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

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

// // //---------------------------------stateless-------------------

// // //---------------------------------------------------------

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController itm = TextEditingController();
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter TextField Example'),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(15),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     controller: itm,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'search here',
//                       // hintText: 'Enter Your Name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: FlatButton(
//                     child: Text(
//                       'LogIn',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     color: Colors.blueAccent,
//                     textColor: Colors.white,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             )));
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() => runApp(mainApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(mainApp());
}

// class mainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: chat(),
//     );
//   }
// }

// class chat extends StatefulWidget {
//   const chat({Key? key}) : super(key: key);

//   @override
//   _chatState createState() => _chatState();
// }

// class _chatState extends State<chat> {
//   bool changeClass = false;
//   String? text;
//   changeClassValue(String? newText) {
//     setState(() {
//       changeClass = !changeClass;
//       text = newText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: changeClass
//           ? container(
//               text: text ?? "",
//             )
//           : textField(
//               changeClassValue: changeClassValue,
//             ),
//     );
//   }
// }

// class textField extends StatefulWidget {
//   textField({Key? key, required this.changeClassValue}) : super(key: key);

//   ValueChanged<String> changeClassValue;

//   @override
//   _textFieldState createState() => _textFieldState();
// }

// class _textFieldState extends State<textField> {
//   final textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: [
//           Container(
//             width: 300.0,
//             height: 60.0,
//             color: Colors.red,
//             child: TextField(
//               controller: textController,
//             ),
//           ),
//           RawMaterialButton(
//             onPressed: () {
//               widget.changeClassValue(textController.text);
//             },
//             child: Icon(Icons.send),
//           )
//         ],
//       ),
//     );
//   }
// }

// class container extends StatefulWidget {
//   container({Key? key, required this.text}) : super(key: key);

//   String text;

//   @override
//   _containerState createState() => _containerState();
// }

// class _containerState extends State<container> {
//   Query dbRef = FirebaseDatabase.instance.ref().child('medicines');
//   DatabaseReference reference =
//       FirebaseDatabase.instance.ref().child('medicines');

//   Widget listItem({required Map student}) {
//     print(student);

//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       // height: 110,
//       color: Color.fromARGB(255, 235, 248, 237),

//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "NAME:" + student['name'],
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             "PRICE : " + student['price'],
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           // const SizedBox(
//           //   height: 5,
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 // onTap: () {
//                 //   Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //           builder: (_) =>
//                 //               UpdateRecord(studentKey: student['key'])));
//                 // },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.edit,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 6,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   reference.child(student['key']).remove();
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.delete,
//                       color: Colors.red[700],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetching data'),
//         ),
//         body: Container(
//           height: double.infinity,
//           child: FirebaseAnimatedList(
//             query: dbRef,
//             itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                 Animation<double> animation, int index) {
//               Map student = snapshot.value as Map;
//               student['key'] = snapshot.key;
//               return listItem(student: student);
//             },
//           ),
//         ));
//   }
// }

class mainApp extends StatelessWidget {
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
          "MOHAN MEDICO ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: "Fredoka One"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CloudFirestoreSearch());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? Firestore.instance
                .collection('items')
                .where("searchKeywords", arrayContains: name)
                .snapshots()
            : Firestore.instance.collection("items").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            data['imageUrl'],
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
