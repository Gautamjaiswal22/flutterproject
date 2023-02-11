import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'package:http/http.dart' as http;

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
  List<dynamic> products = alldata();
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
                  delegate: searchProducts());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),

      body: Center(
        child: ListView.builder(
            itemCount: products == null ? 0 : products.length,
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
                          image: NetworkImage(products[index][4].toString()),
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
                                products[index][1].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  "MRP : ₹ " + products[index][2].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  "RATE : ₹ " + products[index][3].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey.shade900,
                                      //alignment: Alignment.centerRight
                                    ),
                                    onPressed: () {
                                      //saveData(index);
                                    },
                                    child: const Text('Add to Cart')),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'cart',
        child: const Icon(Icons.shopping_cart),
      ),

      //body: FutureBuilder(
      //future: ReadJsonData(),
      // builder: (context, data) {
      //   if (data.hasError) {
      //     return Center(child: Text("${data.error}"));
      //   } else if (data.hasData) {
      //     var items = data.data as List<ProductDataModel>;

      // return ListView.builder(
      // itemCount: products == null ? 0 : products.length,
      // itemBuilder: (context, index) {
      //   return Card(
      //     elevation: 5,
      //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      //     child: Container(
      //       padding: EdgeInsets.all(8),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             width: 50,
      //             height: 50,
      //             child: Image(
      //               image:
      //                   NetworkImage(products[index][4].toString()),
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //           Expanded(
      //               child: Container(
      //             padding: EdgeInsets.only(bottom: 8),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.only(left: 8, right: 8),
      //                   child: Text(
      //                     products[index][1].toString(),
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.only(left: 8, right: 8),
      //                   child: Text(
      //                       "MRP : ₹ " +
      //                           products[index][2].toString(),
      //                       style: TextStyle(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold)),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.only(left: 8, right: 8),
      //                   child: Text(
      //                       "RATE : ₹ " +
      //                           products[index][3].toString(),
      //                       style: TextStyle(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold)),
      //                 ),
      //                 Container(
      //                   child: Align(
      //                     alignment: Alignment.centerRight,
      //                     child: ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           primary: Colors.blueGrey.shade900,
      //                           //alignment: Alignment.centerRight
      //                         ),
      //                         onPressed: () {
      //                           //saveData(index);
      //                         },
      //                         child: const Text('Add to Cart')),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ))
      //         ],
      //       ),
      //     ),
      //   );
      // }
      // );

      // } else {
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
      //},
      //),
    );
  }

  // Future<List<ProductDataModel>> ReadJsonData() async {
  //   final jsondata = await rootBundle.rootBundle
  //       .loadString('assets/jsonfile/productlist.json');
  //   final list = json.decode(jsondata) as List<dynamic>;
  //   return list.map((e) => ProductDataModel.fromJson(e)).toList();
  // }
}

List<dynamic> alldata() {
  List<dynamic> products = [];
  //List<dynamic> products5 = [];
  Future getProductsData() async {
    // var fb = await http
    // .get(Uri.parse("https://medical-a2c8d-default-rtdb.firebaseio.com/"));
    //var d = await http.get("http://mahmoudhelal.atwebpages.com/api/e-commerce_apis/products_api.php?fbclid=IwAR3fsifA0DO0KdhKDTke7wnVQANRy9wd9cgmmoypubXaZuQVDBNXC6Wlf5U");
    final jsondataa = await rootBundle.rootBundle
        .loadString('assets/jsonfile/productlist.json');
    final jsonData = json.decode(jsondataa) as List<dynamic>;
    //final jsonData2 = json.decode(fb) as List<dynamic>;
    //var jsonData = json.decode(jsondataa.body);
    //var jsonData3 = json.decode(fb.body);
    // for (int i = 0; i < jsonData3.length; i++) {
    //   List<dynamic> prodinfo5 = [];
    //   //print("before adding " + jsonData[i]['name']);
    //   //products.add(jsonData[i]['name']);
    //   //products.add(jsonData[i]);
    //   prodinfo5.add(jsonData3[i]['id']);
    //   prodinfo5.add(jsonData3[i]['name']);
    //   prodinfo5.add(jsonData3[i]['oldPrice']);
    //   prodinfo5.add(jsonData3[i]['price']);
    //   prodinfo5.add(jsonData3[i]["imageUrl"]);
    //   products5.add(prodinfo5);
    //   //print("After adding " + products[i]);
    // }
    // print(products5);

    for (int i = 0; i < jsonData.length; i++) {
      List<dynamic> prodinfo = [];
      //print("before adding " + jsonData[i]['name']);
      //products.add(jsonData[i]['name']);
      //products.add(jsonData[i]);
      prodinfo.add(jsonData[i]['id']);
      prodinfo.add(jsonData[i]['name']);
      prodinfo.add(jsonData[i]['oldPrice']);
      prodinfo.add(jsonData[i]['price']);
      prodinfo.add(jsonData[i]["imageUrl"]);
      products.add(prodinfo);
      //print("After adding " + products[i]);
    }
    print(products);
  }

  getProductsData();
  return products;
}

class searchProducts extends SearchDelegate<String> {
  //List<dynamic> products = [];
  List<dynamic> products = alldata();

  // searchProducts() {
  //   getProductsData();
  //   print("Data in the constructor");
  //   print(products);
  // }

  // Future getProductsData() async {
  //   //var d = await http.get("http://mahmoudhelal.atwebpages.com/api/e-commerce_apis/products_api.php?fbclid=IwAR3fsifA0DO0KdhKDTke7wnVQANRy9wd9cgmmoypubXaZuQVDBNXC6Wlf5U");
  //   final jsondataa = await rootBundle.rootBundle
  //       .loadString('assets/jsonfile/productlist.json');
  //   final jsonData = json.decode(jsondataa) as List<dynamic>;
  //   //var jsonData = json.decode(jsondataa.body);

  //   for (int i = 0; i < jsonData.length; i++) {
  //     List<dynamic> prodinfo = [];
  //     //print("before adding " + jsonData[i]['name']);
  //     //products.add(jsonData[i]['name']);
  //     //products.add(jsonData[i]);
  //     prodinfo.add(jsonData[i]['id']);
  //     prodinfo.add(jsonData[i]['name']);
  //     prodinfo.add(jsonData[i]['oldPrice']);
  //     prodinfo.add(jsonData[i]['price']);
  //     prodinfo.add(jsonData[i]["imageUrl"]);
  //     //products.add(prodinfo);

  //     //print("After adding " + products[i]);
  //   }
  //   print(products);
  // }

  //-------------print cart data

  //--------------------------

  //List<dynamic> history = ['h1', 'h2', 'h3'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // return IconButton(
    //   onPressed: () {
    //     //close(context,null);
    //   },
    //   icon: Icon(Icons.arrow_back_ios_new_sharp),
    //   //icon: Icon(Icons.arrow_back),
    // );
    return IconButton(
      //tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //query = "gautam";
        MyHomePage();
        close(context, "a");
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
    List<dynamic> matchQuery = [];
    List<dynamic> cart = [];

    for (var fruit in products) {
      if (fruit[1].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        //itemCount: items == null ? 0 : matchQuery.length,
        itemCount: matchQuery == null ? 0 : matchQuery.length,
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
                      image: NetworkImage(matchQuery[index][4].toString()),
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
                            matchQuery[index][1],
                            //matchQuery[index].name.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text("MRP : " + products[index][2].toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                              " RATE : " + products[index][3].toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        //-----------cart button
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 15, 183, 3),
                                  //alignment: Alignment.centerRight
                                ),
                                onPressed: () {
                                  //saveData(index);
                                  cart.add(products[index]);
                                  print("index");
                                  print(index);
                                  print(cart[index]);
                                },
                                child: const Text('Add to Cart')),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
