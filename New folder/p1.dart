import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'package:faker/faker.dart' as faker;
import 'package:csv_sheet.dart' as csv_sheet;
import 'package:path/path.dart';
import 'package:excel/excel.dart';

// var file = "D:\code\flutterproject\catalog\assets/firstname.xlsx";
// var bytes = File(file).readAsBytesSync();
// var excel = Excel.decodeBytes(bytes);
// print(excel.tables.keys)

void main() {
  File myCsvFile= new File("firstname.csv")
  print("hello world");
  add(10, 26);
}

add(int a, int b) {
  print("addittion");
  print(a + b);
}
