import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import "dart:core";
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> newfun() {
  final lines = File("firstname.csv").readAsLinesSync();
  //lines.removeAt(0);
  var ls = new List.filled(50, "a");
  int count = 0;
  for (var line in lines) {
    final values = line.split(",");
    ls[count] = values[0];
    if (count == 50) {
      break;
    }
    count++;
  }
  return ls;
}

class _MyHomePageState extends State<MyHomePage> {
  // List<String> name = [
  //   "a",
  //   "b",
  //   "c",
  //   "d",
  //   "e",
  // ];

  //List<String>? name = firstclass().newfu();

  List<String>? name = newfun();
  String a => name[0];
  get b => name[1];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER DEMO"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(name[index].toString()),
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
