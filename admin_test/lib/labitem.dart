import 'dart:ffi';

class Products {
  bool check;
  final String name;
  final int v;
  final String id;

  Products(
      {
      // this.valuefirst = false,
      required this.check,
      required this.name,
      required this.id,
      required this.v});

  Map<String, dynamic> toJson() => {
        'check': check,
        'v': v,
        'id': id,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      name: json['name'], check: json['check'], v: json['v'], id: json['id']);
}
