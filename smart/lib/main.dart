import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'clouditem.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:math';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/song.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;
  AudioPlayer player = AudioPlayer();
  bool isb1active = true;
  bool isb2active = false;

  var rng = Random();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List
      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        currentpos = 0;
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      // player.onAudioPositionChanged.listen((Duration p) {
      //   currentpos =
      //       p.inMilliseconds; //get the current position of playing audio

      //   //generating the duration label
      //   int shours = Duration(milliseconds: currentpos).inHours;
      //   int sminutes = Duration(milliseconds: currentpos).inMinutes;
      //   int sseconds = Duration(milliseconds: currentpos).inSeconds;

      //   int rhours = shours;
      //   int rminutes = sminutes - (shours * 60);
      //   int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

      //   currentpostlabel = "$rhours:$rminutes:$rseconds";

      //   setState(() {
      //     //refresh the UI
      //   });
      // });
    });
    super.initState();
  }

  //--------------alan ai
  _MainPageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "87ef00f50ac8e1fa3daf21430124ccc12e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command) {
    switch (command['command']) {
      case 'on 1':
        final docuser = FirebaseFirestore.instance
            .collection('USERS')
            .doc("GAUTAM")
            .collection("DEVICE")
            .doc("20");

        docuser.update({
          'status': 1,
          'offbut': true,
          'onbut': false,
          "word_status": "ON",
        });
        break;
      case 'off 1':
        final docuser = FirebaseFirestore.instance
            .collection('USERS')
            .doc("GAUTAM")
            .collection("DEVICE")
            .doc("20");

        docuser.update({
          'status': 0,
          'offbut': false,
          'onbut': true,
          "word_status": "OFF",
        });
        break;

      case 'on 2':
        final docuser = FirebaseFirestore.instance
            .collection('USERS')
            .doc("GAUTAM")
            .collection("DEVICE")
            .doc("30");

        docuser.update({
          'status': 1,
          'offbut': true,
          'onbut': false,
          "word_status": "ON",
        });
        break;
      case 'off 2':
        final docuser = FirebaseFirestore.instance
            .collection('USERS')
            .doc("GAUTAM")
            .collection("DEVICE")
            .doc("30");

        docuser.update({
          'status': 0,
          'offbut': false,
          'onbut': true,
          "word_status": "OFF",
        });
        break;
      case 'play':
        // var song = ["s, "beliver.mp3"];
        // int currentpos = 0;
        // var ch = rng.nextInt(1);
        player.play(AssetSource("beliver.mp3"));
        break;
      case 'pause':
        player.pause();
        break;
      default:
        debugPrint("unknown command");
    }
  }
  //-----------------alan Ai over-----------

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("SMART REMOTE FOR SMART PEOPLE"),
        ),

        // drawer: Drawer(
        //   child: ListView(
        //     padding: const EdgeInsets.all(0),
        //     children: [
        //       ListTile(
        //         leading: const Icon(Icons.person),
        //         title: Text(a.status.toString()),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),

        body: StreamBuilder<List<Products>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went Wrong ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(children: users.map(buildUser).toList());
                return Text("data found");
              } else {
                // return Text(" data not found");
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
                      padding: EdgeInsets.only(left: 150, right: 8),
                      child: Text(
                          user.name.toString() + " is " + user.word_status,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("DEVICE  :" + user.name.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("status :" + user.status.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),

//------in one row---
                    Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(children: <Widget>[
                            Container(
                              child: SizedBox(
                                width: 30.0,
                                height: 10.0,
                              ),
                            ),

                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      onSurface: Colors.blue,
                                    ),
                                    child: Text("SWITCH ON"),
                                    onPressed: user.onbut
                                        ? () {
                                            final docuser = FirebaseFirestore
                                                .instance
                                                .collection('USERS')
                                                .doc("GAUTAM")
                                                .collection("DEVICE")
                                                .doc('${user.id}');

                                            docuser.update({
                                              'status': 1,
                                              'offbut': true,
                                              'onbut': false,
                                              "word_status": "ON",
                                            });
                                            setState(() {
                                              user.offbut = true;
                                              user.onbut = false;
                                            });
                                          }
                                        : null,
                                  )),
                            ),

                            Container(
                              child: SizedBox(
                                width: 10.0,
                                height: 10.0,
                              ),
                            ),

                            // Container(
                            //   child: Align(
                            //       alignment: Alignment.centerRight,
                            //       child: IconButton(
                            //           onPressed: isb1active
                            //               ? () {
                            //                   final docuser = FirebaseFirestore
                            //                       .instance
                            //                       .collection('USERS')
                            //                       .doc("GAUTAM")
                            //                       .collection("DEVICE")
                            //                       .doc('${user.mid}');
                            //                   if (user.status == 1) {
                            //                     docuser.update({
                            //                       'status': 0,
                            //                     });
                            //                   } else {
                            //                     docuser.update({
                            //                       'status': 0,
                            //                     });
                            //                   }
                            //                 }
                            //               : null,
                            //           icon: const Icon(Icons.pause_circle))),
                            // ),

                            //-----------count show----
                            Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                        user.word_status + ": ${user.status}"),
                                  )),
                            ),

                            Container(
                              child: SizedBox(
                                width: 10.0,
                                height: 10.0,
                              ),
                            ),
                            // Container(
                            //   child: Align(
                            //     alignment: Alignment.centerRight,
                            //     child: IconButton(
                            //         onPressed: () {
                            //           final docuser = FirebaseFirestore.instance
                            //               .collection('USERS')
                            //               .doc("GAUTAM")
                            //               .collection("DEVICE")
                            //               .doc('${user.id}');
                            //           if (user.status == 1) {
                            //             docuser.update({
                            //               'status': 1,
                            //             });
                            //           } else {
                            //             docuser.update({
                            //               'status': 1,
                            //             });
                            //           }
                            //         },
                            //         icon: const Icon(Icons.power_settings_new)),
                            //   ),
                            // ),

                            Container(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      onSurface: Colors.blue,
                                    ),
                                    child: Text("SWITCH OFF"),
                                    onPressed: user.offbut
                                        ? () {
                                            // player.pause();
                                            final docuser = FirebaseFirestore
                                                .instance
                                                .collection('USERS')
                                                .doc("GAUTAM")
                                                .collection("DEVICE")
                                                .doc('${user.id}');
                                            docuser.update({
                                              'status': 0,
                                              'offbut': false,
                                              'onbut': true,
                                              "word_status": "OFF",
                                            });

                                            setState(() {
                                              user.onbut = true;
                                              user.offbut = false;
                                            });
                                          }
                                        : null,
                                    // icon: cosnst Icon(Icons.pause_circle)
                                  )),
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
      .collection("USERS")
      .doc("GAUTAM")
      .collection("DEVICE")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());

  Stream<List<network>> readwifi() => FirebaseFirestore.instance
      .collection("USERS")
      .doc("GAUTAM")
      .collection("update")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => network.fromJson(doc.data())).toList());
}
