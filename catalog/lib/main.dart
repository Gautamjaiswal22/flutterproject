import 'package:flutter/material.dart';
//--------------------------
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import "dart:core";
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:catalog/bulkUpload.dart';
//-----------------------------

void main() {
  // final lines = File("firstname.csv").readAsLinesSync();
  // lines.removeAt(0);
  // int count = 0;
  // var ls = new List.filled(50, "a");
  // for (var line in lines) {
  //   final values = line.split(",");
  //   ls[count] = values[0];
  //   if (count == 10) {
  //     break;
  //   }
  //   count = count + 1;
  // }
  // var searchTerms = ls;
  // print(ls[0]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOHAN MEDICO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GFG(),
    );
  }
}

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

// List<String>? newfun() {
//   final lines = File("firstname.csv").readAsLinesSync();
//   //lines.removeAt(0);
//   var ls = new List.filled(50, "a");
//   int count = 0;
//   for (var line in lines) {
//     final values = line.split(",");
//     ls[count] = values[0];
//     if (count == 50) {
//       break;
//     }
//     count++;
//   }
//   return ls;
// }

class _GFGState extends State<GFG> {
  // List<String>? searchTerm = newfun();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MOHAN MEDICO",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
//Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  // List<String>? searchTerms = newfun();
//---------------------------------------------------------

  // CustomSearchDelegate() {
  //   final lines = File("firstname.csv").readAsLinesSync();
  //   //lines.removeAt(0);
  //   var ls = new List.filled(50, "a");
  //   int count = 0;
  //   for (var line in lines) {
  //     final values = line.split(",");
  //     ls[count] = values[0];
  //     if (count == 10) {
  //       break;
  //     }
  //     count++;
  //   }
  //   ls;

  //   //*********************
  // }

  //print(newfun());

  //List<String>? searchTerm = newfun();
  //searchTerms=newfun();

  // for (var line in lines) {
  //   final values = line.split(",");
  //   ls[count] = values[0];
  //   if (count == 10) {
  //     break;
  //   }
  //   count = count + 1;
  // }
//---------------------------------------------------------------------
//first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    //String fruit = "hello gautam";
    //List<String>? searchTerm = newfun();
    //print(searchTerm);
    // for (var i = 0; i < 50; i++) {
    //   //String fru = "gautam";

    //   //String fruit = searchTerm[i];
    //   //String fruit = searchTerm?[i] ?? "no";

    //   String fruit = searchTerm[i];

    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    // List<String>? searchTerm = newfun();
    // for (var i = 0; i < 45; i++) {
    //   if (searchTerms != null) {
    //     String fruit = searchTerm?[1] ?? "no";
    //   }
    //   //String fruit = searchTerm[i];
    //   String fruit = searchTerm?[i] ?? "no";

    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
