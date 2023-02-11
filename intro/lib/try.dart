import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
//import 'dart:ui';
import "dart:core";
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  var jaiswal = new gautam();
  jaiswal.greet();
  // @override
  // State<MyHomePage> createState() => _MyHomePageState();
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
  String a = name[0];
  get b => name[1];
}

class gautam {
  List<String> name = newfun();
  String a = name[0];
  get b => name[1];
  greet() {
    print(b);
  }
}
