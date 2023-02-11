import 'dart:ffi';

class Products {
  bool check;
  final String name;
  final int rate;
  final String id;

  Products(
      {
      // this.valuefirst = false,
      required this.check,
      required this.name,
      required this.id,
      required this.rate});

  Map<String, dynamic> toJson() => {
        'check': check,
        'rate': rate,
        'id': id,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      name: json['name'],
      check: json['check'],
      rate: json['rate'],
      id: json['id']);
}
