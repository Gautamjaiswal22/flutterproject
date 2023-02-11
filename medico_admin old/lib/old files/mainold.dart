import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MOHAN MEDICO 1",
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontFamily: "Fredoka One"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  //delegate: CustomSearchDelegate());
                  delegate: searchProducts());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: NetworkImage(
                                  items[index].imageURL.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    items[index].name.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                      "hehe Price : " +
                                          items[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('assets/jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  //------------------------------

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: FutureBuilder(
  //     future: ReadJsonData(),
  //     builder: (context, data) {
  //       if (data.hasError) {
  //         return Center(child: Text("${data.error}"));
  //       } else if (data.hasData) {
  //         var items = data.data as List<ProductDataModel>;
  //         return ListView.builder(
  //             itemCount: items == null ? 0 : items.length,
  //             itemBuilder: (context, index) {
  //               return Card(
  //                 elevation: 5,
  //                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //                 child: Container(
  //                   padding: EdgeInsets.all(8),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         width: 50,
  //                         height: 50,
  //                         child: Image(
  //                           image:
  //                               NetworkImage(items[index].imageURL.toString()),
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                       Expanded(
  //                           child: Container(
  //                         padding: EdgeInsets.only(bottom: 8),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Padding(
  //                               padding: EdgeInsets.only(left: 8, right: 8),
  //                               child: Text(
  //                                 items[index].name.toString(),
  //                                 style: TextStyle(
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                             Padding(
  //                               padding: EdgeInsets.only(left: 8, right: 8),
  //                               child: Text(
  //                                   "Price : " + items[index].price.toString(),
  //                                   style: TextStyle(
  //                                       fontSize: 16,
  //                                       fontWeight: FontWeight.bold)),
  //                             )
  //                           ],
  //                         ),
  //                       ))
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             });
  //       } else {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   ));
  // }

  // Future<List<ProductDataModel>> ReadJsonData() async {
  //   final jsondata =
  //       await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
  //   final list = json.decode(jsondata) as List<dynamic>;
  //   return list.map((e) => ProductDataModel.fromJson(e)).toList();
  // }
}

//************************************************************************************ */

//++++++++++++++++++++++++++++++++++++search+++++++++++++++++++++++++++++++++++++++++++++++++++++

//import 'package:catalog/bulkUpload.dart';
//-----------------------------

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MOHAN MEDICO',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: GFG(),
//     );
//   }
// }

// class GFG extends StatefulWidget {
//   const GFG({Key? key}) : super(key: key);

//   @override
//   State<GFG> createState() => _GFGState();
// }

// class _GFGState extends State<GFG> {
//   // List<String>? searchTerm = newfun();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "MOHAN MEDICO 2",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // method to show the search bar
//               showSearch(
//                   context: context,
//                   // delegate to customize the search bar
//                   delegate: CustomSearchDelegate());
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//     );
//   }

//   Future<List<ProductDataModel>> ReadJsonData() async {
//     final jsondata = await rootBundle.rootBundle
//         .loadString('assets/jsonfile/productlist.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => ProductDataModel.fromJson(e)).toList();
//   }
// }

class searchProducts extends SearchDelegate<String> {
  List<dynamic> products = [];

  searchProducts() {
    getProductsData();
    print("Data in the constructor");
    print(products);
  }

  Future getProductsData() async {
    //var d = await http.get("http://mahmoudhelal.atwebpages.com/api/e-commerce_apis/products_api.php?fbclid=IwAR3fsifA0DO0KdhKDTke7wnVQANRy9wd9cgmmoypubXaZuQVDBNXC6Wlf5U");
    final jsondataa = await rootBundle.rootBundle
        .loadString('assets/jsonfile/productlist.json');
    final jsonData = json.decode(jsondataa) as List<dynamic>;
    //var jsonData = json.decode(jsondataa.body);
    for (int i = 0; i < jsonData.length; i++) {
      //print("before adding " + jsonData[i]['name']);
      products.add(jsonData[i]['name']);
      //print("After adding " + products[i]);
    }
  }

  List<dynamic> history = ['h1', 'h2', 'h3'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "nothing";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        //this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Returned");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

//--------------------------------
    for (var fruit in products) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      //itemCount: items == null ? 0 : matchQuery.length,
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Card(
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
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          result,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
        // return ListTile(
        //   title: Text(result),
        // );
      },
    );
  }
}



//#########################################################3search old start##################################3
//#########################################################3search old start##################################3
//#########################################################3search old start##################################3
//#########################################################3search old start##################################3
// class CustomSearchDelegate extends SearchDelegate {
// //Demo list to show querying
//   // List<String> searchTerms = [
//   //   "Apple",
//   //   "Banana",
//   //   "Mango",
//   //   "Pear",
//   //   "Watermelons",
//   //   "Blueberries",
//   //   "Pineapples",
//   // ];
//   List<String> searchTerms = [];
//   //searchTerms.add("gautam");
//   CustomSearchDelegate() {
//     Future<List<ProductDataModel>> ReadJsonData() async {
//       final jsondata = await rootBundle.rootBundle
//           .loadString('assets/jsonfile/productlist.json');
//       final list = json.decode(jsondata) as List<dynamic>;
//       return list.map((e) => ProductDataModel.fromJson(e)).toList();
//     }

//     // var items = .data as List<ProductDataModel>;
//     //         var temp = 0;
//     //         searchTerms.add("gautam");
//     //         for (var newitem in items) {
//     //           searchTerms.add(items[temp].name.toString());
//     //           temp++;
//     //         }
//   }
// //-----------------------------------------start-----------------------------------------------------------------------
//   Widget build(BuildContext context) {
//     List<String> searchTerms = [];
//     return Scaffold(
//         body: FutureBuilder(
//       future: ReadJsonData(),
//       builder: (context, data) {
//         if (data.hasError) {
//           return Center(child: Text("${data.error}"));
//         } else if (data.hasData) {
//           var items = data.data as List<ProductDataModel>;
//           var temp = 0;
//           searchTerms.add("gautam");
//           for (var newitem in items) {
//             searchTerms.add(items[temp].name.toString());
//             temp++;
//           }
//           return Drawer(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: const <Widget>[
//                 DrawerHeader(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                   ),
//                   child: Text(
//                     'Drawer Header',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.message),
//                   title: Text('Messages'),
//                 ),
//               ],
//             ),
//           );

//           // return ListView.builder(
//           //     itemCount: items == null ? 0 : items.length,
//           //     itemBuilder: (context, index) {
//           //       var temp = 0;
//           //       // for (var newitem in items) {
//           //       //   searchTerms.add(items[temp].name.toString());
//           //       //   temp++;
//           //       // }
//           //       return Card(
//           //         elevation: 5,
//           //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           //         child: Container(
//           //           padding: EdgeInsets.all(8),
//           //           child: Row(
//           //             mainAxisAlignment: MainAxisAlignment.center,
//           //             crossAxisAlignment: CrossAxisAlignment.center,
//           //             children: [
//           //               Container(
//           //                 width: 50,
//           //                 height: 50,
//           //                 child: Image(
//           //                   image:
//           //                       NetworkImage(items[index].imageURL.toString()),
//           //                   fit: BoxFit.fill,
//           //                 ),
//           //               ),
//           //               Expanded(
//           //                   child: Container(
//           //                 padding: EdgeInsets.only(bottom: 8),
//           //                 child: Column(
//           //                   mainAxisAlignment: MainAxisAlignment.center,
//           //                   crossAxisAlignment: CrossAxisAlignment.start,
//           //                   children: [
//           //                     Padding(
//           //                       padding: EdgeInsets.only(left: 8, right: 8),
//           //                       child: Text(
//           //                         items[index].name.toString(),
//           //                         style: TextStyle(
//           //                             fontSize: 16,
//           //                             fontWeight: FontWeight.bold),
//           //                       ),
//           //                     ),
//           //                     Padding(
//           //                       padding: EdgeInsets.only(left: 8, right: 8),
//           //                       child: Text(
//           //                           "yo yo Price : " +
//           //                               items[index].price.toString(),
//           //                           style: TextStyle(
//           //                               fontSize: 16,
//           //                               fontWeight: FontWeight.bold)),
//           //                     )
//           //                   ],
//           //                 ),
//           //               ))
//           //             ],
//           //           ),
//           //         ),
//           //       );
//           //     });
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     ));
//   }

//   Future<List<ProductDataModel>> ReadJsonData() async {
//     final jsondata = await rootBundle.rootBundle
//         .loadString('assets/jsonfile/productlist.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => ProductDataModel.fromJson(e)).toList();
//   }
// //--------------------------------------------end---------------

// //first overwrite to
// // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = ''; //onclick default search value =""
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }

// // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back_ios_new_sharp),
//       //icon: Icon(Icons.arrow_back),
//     );
//   }

// // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   //List<String> searchTerms = [];
// // last overwrite to show the
// // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     //List<String> newlist = [];
// //********************start**************
//     // for (var fruit in searchTerms) {
//     //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
//     //     matchQuery.add(fruit);
//     //   }
//     // }
//     // return Scaffold(
//     //     body: FutureBuilder(
//     //   future: ReadJsonData(),
//     //   builder: (context, data) {
//     //     if (data.hasError) {
//     //       return Center(child: Text("${data.error}"));
//     //     } else if (data.hasData) {
//     //       var items = data.data as List<ProductDataModel>;
//     //       // for (var newitem in items) {
//     //       //   newlist.add(items[index].name.toString());
//     //       // }
//     //       return ListView.builder(
//     //           //itemCount: items == null ? 0 : items.length,
//     //           //itemBuilder: (context, index) {
//     //             var temp = 0;
//     //             for (var newitem in items) {
//     //               searchTerms.add(items[temp].name.toString());
//     //               temp++;
//     //             }
//     //          itemCount: matchQuery.length,
//     //           itemBuilder: (context, index) {
//     //             var result = matchQuery[index];
//     //             return Card(
//     //       elevation: 5,
//     //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//     //       child: Container(
//     //         padding: EdgeInsets.all(8),
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           crossAxisAlignment: CrossAxisAlignment.center,
//     //           children: [
//     //             Expanded(
//     //                 child: Container(
//     //               padding: EdgeInsets.only(bottom: 8),
//     //               child: Column(
//     //                 mainAxisAlignment: MainAxisAlignment.center,
//     //                 crossAxisAlignment: CrossAxisAlignment.start,
//     //                 children: [
//     //                   Padding(
//     //                     padding: EdgeInsets.only(left: 8, right: 8),
//     //                     child: Text(
//     //                       result,
//     //                       style: TextStyle(
//     //                           fontSize: 16, fontWeight: FontWeight.bold),
//     //                     ),
//     //                   ),
//     //                 ],
//     //               ),
//     //             ))
//     //           ],
//     //         ),
//     //       ),
//     //     );
//     //           });
//     //     } else {
//     //       return Center(
//     //         child: CircularProgressIndicator(),
//     //       );
//     //     }
//     //   },
//     // ));

// //*********************end*************** */ */
//     // for (var fruit in searchTerms) {
//     //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
//     //     matchQuery.add(fruit);
//     //   }
//     // }
//     // return Scaffold(
//     //     body: FutureBuilder(
//     //   future: ReadJsonData(),
//     //   builder: (context, data) {
//     //     if (data.hasError) {
//     //       return Center(child: Text("${data.error}"));
//     //     } else if (data.hasData) {
//     //       var items = data.data as List<ProductDataModel>;
//     //       // for (var newitem in items) {
//     //       //   newlist.add(items[index].name.toString());
//     //       // }
//     //       return ListView.builder(
//     //           itemCount: items == null ? 0 : items.length,
//     //           itemBuilder: (context, index) {
//     //             var temp = 0;
//     //             for (var newitem in items) {
//     //               newlist.add(items[temp].name.toString());
//     //               temp++;
//     //             }
//     //             return Card(
//     //               elevation: 5,
//     //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//     //               child: Container(
//     //                 padding: EdgeInsets.all(8),
//     //                 child: Row(
//     //                   mainAxisAlignment: MainAxisAlignment.center,
//     //                   crossAxisAlignment: CrossAxisAlignment.center,
//     //                   children: [
//     //                     Container(
//     //                       width: 50,
//     //                       height: 50,
//     //                       child: Image(
//     //                         image:
//     //                             NetworkImage(items[index].imageURL.toString()),
//     //                         fit: BoxFit.fill,
//     //                       ),
//     //                     ),
//     //                     Expanded(
//     //                         child: Container(
//     //                       padding: EdgeInsets.only(bottom: 8),
//     //                       child: Column(
//     //                         mainAxisAlignment: MainAxisAlignment.center,
//     //                         crossAxisAlignment: CrossAxisAlignment.start,
//     //                         children: [
//     //                           Padding(
//     //                             padding: EdgeInsets.only(left: 8, right: 8),
//     //                             child: Text(
//     //                               items[index].name.toString(),
//     //                               style: TextStyle(
//     //                                   fontSize: 16,
//     //                                   fontWeight: FontWeight.bold),
//     //                             ),
//     //                           ),
//     //                           Padding(
//     //                             padding: EdgeInsets.only(left: 8, right: 8),
//     //                             child: Text(
//     //                                 "MRP : " +
//     //                                     newlist[4] +
//     //                                     "  >> " +
//     //                                     items[index].oldPrice.toString(),
//     //                                 style: TextStyle(
//     //                                     fontSize: 18,
//     //                                     fontWeight: FontWeight.bold)),
//     //                           ),
//     //                           Padding(
//     //                             padding: EdgeInsets.only(left: 8, right: 8),
//     //                             child: Text(
//     //                                 "RATE : " + items[index].price.toString(),
//     //                                 style: TextStyle(
//     //                                     fontSize: 18,
//     //                                     fontWeight: FontWeight.bold)),
//     //                           )
//     //                         ],
//     //                       ),
//     //                     ))
//     //                   ],
//     //                 ),
//     //               ),
//     //             );
//     //           });
//     //     } else {
//     //       return Center(
//     //         child: CircularProgressIndicator(),
//     //       );
//     //     }
//     //   },
//     // ));
// //--------------------------------
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       //itemCount: items == null ? 0 : matchQuery.length,
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return Card(
//           elevation: 5,
//           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           child: Container(
//             padding: EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                     child: Container(
//                   padding: EdgeInsets.only(bottom: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 8, right: 8),
//                         child: Text(
//                           result,
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//               ],
//             ),
//           ),
//         );
//         // return ListTile(
//         //   title: Text(result),
//         // );
//       },
//     );
//   }
// }
