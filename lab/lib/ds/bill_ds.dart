import 'dart:ffi';

import 'package:flutter/material.dart';

class Products {
  // String id;
  // final int ;
  final String name;
  final String address;
  final String age;
  final String gender;
  final String Mobile;

  Products({
    // this.id = '',
    // required this.mid,
    required this.name,
    required this.address,
    required this.age,
    required this.gender,
    required this.Mobile,
  });

  Map<String, dynamic> toJson() => {
        // 'id': id,
        // 'mid': mid,
        'name': name,
        'address': address,
        'age': age,
        'gender': gender,
        'Mobile': Mobile,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      // id: json['id'],
      // mid: json['mid'],
      name: json['name'],
      address: json['address'],
      age: json['age'],
      gender: json['gender'],
      Mobile: json['Mobile']);
}

class test {
  // bool check;
  final String name;
  final int rate;
  final String id;

  test(
      {
      // this.valuefirst = false,
      // required this.check,
      required this.name,
      required this.id,
      required this.rate});

  Map<String, dynamic> toJson() => {
        // 'check': check,
        'name': name,
        'rate': rate,
        'id': id,
      };
  static test fromJson(Map<String, dynamic> json) => test(
      name: json['name'],
      // check: json['check'],
      rate: json['rate'],
      id: json['id']);
}
