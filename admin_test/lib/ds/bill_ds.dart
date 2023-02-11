import 'dart:ffi';

import 'package:flutter/material.dart';

class Products {
  String id;
  final int mid;
  final String name;
  final int mrp;
  final int rate;
  final int itemcount;
  final int total;

  Products({
    this.id = '',
    required this.mid,
    required this.name,
    required this.mrp,
    required this.rate,
    required this.itemcount,
    required this.total,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'mid': mid,
        'name': name,
        'mrp': mrp,
        'rate': rate,
        'itemcount': itemcount,
        'total': total,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      id: json['id'],
      mid: json['mid'],
      name: json['name'],
      mrp: json['mrp'],
      rate: json['rate'],
      itemcount: json['itemcount'],
      total: json['total']);
}

class Address {
  final String name;
  final Map ADDRESS;
  final int MOBILE_NO;

  Address({required this.name, required this.ADDRESS, required this.MOBILE_NO});

  Map<String, dynamic> toJson() =>
      {'name': name, 'ADDRESS': ADDRESS, "MOBILE_NO": MOBILE_NO};
  static Address fromJson(Map<String, dynamic> json) => Address(
      name: json['name'],
      ADDRESS: json["ADDRESS"],
      MOBILE_NO: json["MOBILE_NO"]);
}
